#
# The Static strategy generate static values according to the data type of any primitive or enum property.
#
# This strategy DOES NOT GENERATE VALID DATA (yet) agains the given JSON schema
#

module JsonSchema
  module Artesano
    module Tools
      class Static
        attr_reader :opts

        def initialize(opts = {})
          @opts = opts
        end

        def shape_object(material)
          material
        end

        def shape_array(material)
          material
        end

        def shape_primitive(material)
          case material.type[0]
          when 'boolean'
            opts[:boolean] || false
          when 'integer'
            opts[:integer] || static_integer
          when 'number'
            opts[:number] || static_number
          when 'string'
            opts[:string] || static_string
          end
        end

        def shape_enum(material)
          opts[:enum]  || material.enum[0]
        end

        private

        # TODO: Handle metadata to
        # generate valid data
        def static_string
          'Lorem ipsum dolor sit amet'
        end

        def static_integer
          22
        end

        def static_number
          22.15
        end
      end
    end
  end
end
