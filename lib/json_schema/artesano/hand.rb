#
# Give it a sketch (JSON Schema), a Tool (strategy), and it
# will *mold* a product (hopefully) conformmatches the sketch.
#

require 'json'
require 'json_schema'

require_relative 'tools/static'

module JsonSchema
  module Artesano
    class Hand
      PRIMITIVE_MATERIALS = %w{null boolean number string integer}.freeze

      attr_reader :tool

      def initialize(tool: Tools::Static)
        self.use_tool(tool)
      end

      def use_tool(tool)
        @tool = tool.new
      end

      def mold(sketch)
        transform( material(sketch) )
      end

      private

      def transform(material)
        case material.type[0]
        when *PRIMITIVE_MATERIALS
          tool.shape_primitive(material)
        when 'object'
          # OneOf
          if material.one_of.any?
            item = tool.select_oneof( material.one_of )
            return tool.shape_object( transform_object(item) )
          end

          # Plain
          tool.shape_object( transform_object(material) )
        when 'array'
          # AnyOf
          if material.any_of.any?
            items = tool.select_anyof( material.any_of )
            items = [items] unless items.is_a?(Array)

            return tool.shape_array( transform_array(items) )
          end

          # AllOf
          if material.all_of.any?
            array = material.all_of
            return tool.shape_array( transform_array(array) )
          end

          tool.shape_array( transform_array(material) )
        else
          # Enum
          if !material.enum.nil?
            return tool.shape_enum(material)
          end

          # Null
        end
      end

      def transform_object(object)
        object.properties.inject(Hash.new) do |result, property|
          result.merge(
            { property[0] => transform( property[1] ) }
          )
        end
      end

      def transform_array(array)
        items = array.respond_to?(:items) ? [array.items] : array
        items.flatten.map { |item| transform(item) }
      end

      def material(sketch)
        JsonSchema.parse!(sketch).tap { |schema| schema.expand_references! }
      end
    end
  end
end
