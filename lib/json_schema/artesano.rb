require_relative 'artesano/hand'
require_relative 'artesano/tools/static'

module JsonSchema
  module Artesano
    def self.mold(sketch:, tool: Tools::Static)
      Hand.new(tool: tool).mold(sketch)
    end
  end
end
