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

        def shape_array(materials)
          materials
        end

        def shape_primitive(material)
          nil
        end

        def shape_enum(material)
          nil
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
