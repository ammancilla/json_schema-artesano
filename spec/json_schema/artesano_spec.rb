require 'spec_helper'

RSpec.describe JsonSchema::Artesano do
  let(:sketch) { support_sketch('schema') }

  let(:expected_null) do
    {"@type"=>nil, "id"=>nil, "uuid"=>nil, "@poll_type"=>nil, "title"=>nil, "image"=>{"@type"=>nil, "cloudinary_id"=>nil, "caption"=>nil, "height"=>nil, "width"=>nil, "original_format"=>nil}, "answers"=>[{"id"=>nil, "uuid"=>nil, "title"=>nil, "correct"=>nil, "un_enum"=>nil}]}
  end

  let(:expected_data_type) do
    {"@type"=>"enum[string]", "id"=>"integer", "uuid"=>"string", "@poll_type"=>"enum[string]", "title"=>"string", "image"=>{"@type"=>"enum[string]", "cloudinary_id"=>"string", "caption"=>"string", "height"=>"integer", "width"=>"integer", "original_format"=>"enum[string]"}, "answers"=>[{"id"=>"integer", "uuid"=>"string", "title"=>"string", "correct"=>"boolean", "un_enum"=>"enum"}]}
  end

  let(:expected_data_type) do
    {"@type"=>"Lorem ipsum dolor sit amet", "id"=>22, "uuid"=>"Lorem ipsum dolor sit amet", "@poll_type"=>"Lorem ipsum dolor sit amet", "title"=>"Lorem ipsum dolor sit amet", "image"=>{"@type"=>"Lorem ipsum dolor sit amet", "cloudinary_id"=>"Lorem ipsum dolor sit amet", "caption"=>"Lorem ipsum dolor sit amet", "height"=>22, "width"=>22, "original_format"=>"Lorem ipsum dolor sit amet"}, "answers"=>[{"id"=>22, "uuid"=>"Lorem ipsum dolor sit amet", "title"=>"Lorem ipsum dolor sit amet", "correct"=>false, "un_enum"=>"apo"}]}
  end

  subject { JsonSchema::Artesano::Hand.new(tool: tool).mold(sketch) }

  describe 'tools' do
    context 'Tools::Null' do
      let(:tool) { JsonSchema::Artesano::Tools::Null }

      it 'works' do
	expect { subject }.not_to raise_error
      end
    end

    context 'Tools::DataType' do
      let(:tool) { JsonSchema::Artesano::Tools::DataType }

      it 'works' do
	expect { subject }.not_to raise_error
      end
    end

    context 'Tools::Static' do
      let(:tool) { JsonSchema::Artesano::Tools::Static }

      it 'works' do
	expect { subject }.not_to raise_error
      end
    end
  end
end
