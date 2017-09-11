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
          type = material.type[0]
          material.enum.nil? ? type : "enum[#{type}]"
        end

        def shape_enum(material)
          'enum'
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
