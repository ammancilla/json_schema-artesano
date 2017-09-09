require 'spec_helper'

RSpec.describe JsonSchema::Artesano::Hand do
  let(:hand) { described_class.new }

  describe '#mold' do
    it 'works' do
      expect { hand.mold( sketch('schema') ) }.not_to raise_error
    end
  end
end

def sketch(name)
  schema_path = File.expand_path("../../../support/#{name}.json", __FILE__)
  JSON.parse( File.read(schema_path) )
end
