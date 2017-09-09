#
# The Null strategy uses 'nil' as the generated data for any primitive or enum property.
#
# This strategy DOES NOT GENERATE VALID DATA agains the given JSON schema
#

module JsonSchema
  module Artesano
    module Tools
      class Null
        def initialize
        end

        def shape_object(material)
          material
        end

        def shape_array(material)
          material
        end

        def shape_primitive(material)
          nil
        end

        def shape_enum(material)
          nil
        end
      end
    end
  end
end
