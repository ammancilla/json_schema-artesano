#
# This tool (strategy) doesn't provide any value.
# Assigns 'nil' to any primitive or enum property.
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
