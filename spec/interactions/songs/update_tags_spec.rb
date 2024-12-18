# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Songs::UpdateTags, type: :interaction do
  describe 'execute' do
    let(:path) { "#{file_fixture_path}/audios/without_tags/_01_seed_of_an_idea.mp3" }
    let(:inputs) { { path: } }

    context 'when don\'t exist songs previously' do
      let(:inputs) { { path: '' } }

      it 'returns something' do
        expect(errors).to eq({ song: ['is required'] })
      end
    end
  end
end
