#
# The DataType strategy uses the data type of any primitive or enum property as the generated data.
#
# This strategy DOES NOT GENERATE VALID DATA agains the given JSON schema
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
      end
    end
  end
end
