require 'spec_helper'

RSpec.describe JsonSchema::Artesano::Hand do
  let(:hand) { described_class.new }

  describe '#mold' do
    it 'works' do
      expect { hand.mold( support_sketch('schema') ) }.not_to raise_error
    end
  end
end

