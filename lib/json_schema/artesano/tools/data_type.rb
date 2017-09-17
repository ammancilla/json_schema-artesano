#
# The DataType strategy uses the data type of any primitive or enum property as the generated data.
#
# IMPORTANT:
# Generates valid data agains a given schema? NO!
#

module JsonSchema
  module Artesano
    module Tools
      class DataType
        def initialize
        end

        def shape_object(material)
          material
        end

        def shape_array(material)
          material
        end

        def shape_primitive(material)
          material.type[0]
        end

        def shape_enum(material)
          enum_type = material.type[0]
          enum_type.nil? ? 'enum' : "enum[#{enum_type}]"
        end

        def select_oneof(materials)
          materials.sample
        end

        def select_anyof(materials)
          materials.sample
        end
      end
    end
  end
end
