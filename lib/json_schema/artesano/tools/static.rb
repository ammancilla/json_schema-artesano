#
# The Static strategy generate static values according to the data type of any primitive or enum property.
#
# This strategy DOES NOT GENERATE VALID DATA (yet) agains the given JSON schema
#

module JsonSchema
  module Artesano
    module Tools
      class Static
        def initialize
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
            false
          when 'integer'
            22
          when 'number'
            22.15
          when 'string'
            'Lorem ipsum dolor sit amet'
          end
        end

        def shape_enum(material)
          material.enum[0]
        end

        def select_oneof(materials)
          materials[0]
        end

        def select_anyof(materials)
          materials[0]
        end
      end
    end
  end
end
