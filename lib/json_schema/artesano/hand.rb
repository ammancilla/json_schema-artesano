#
# Give it a sketch (JSON Schema), a Tool (strategy), and it
# will *mold* a product that (hopefully) matches the sketch.
#

require 'json'
require 'json_schema'

require_relative 'tools/null'
require_relative 'tools/data_type'
require_relative 'tools/static'

module JsonSchema
  module Artesano
    class Hand
      PRIMITIVE_MATERIALS = %w{null boolean number string integer}.freeze

      attr_reader :tool

      def initialize(tool: Tools::Null)
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
        when 'object'
          tool.shape_object( transform_object(material) )
        when 'array'
          tool.shape_array( transform_array(material) )
        when *PRIMITIVE_MATERIALS
          tool.shape_primitive(material)
        else
          # OneOf
          if material.one_of.any?
            return tool.shape_oneof(material)
          end

          # AllOf
          if material.all_of.any?
            return tool.shape_allof(material)
          end

          # AnyOf
          if material.any_of.any?
            return tool.shape_anyof(material)
          end

          # Enum
          if !material.enum.nil?
            return tool.shape_enum(material)
          end

          # Non expanded reference
          if !material.reference.nil?
            # Expand, transform & process
          end

          # Null
          # Nothing for nil yet

          # Anything else
          raise "Material not supported: #{material}"
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
        items = [array.items].flatten
        items.map! { |item| transform(item) }
      end

      def material(sketch)
        JsonSchema.parse!(sketch).tap { |schema| schema.expand_references! }
      end
    end
  end
end
