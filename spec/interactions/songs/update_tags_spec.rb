# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Songs::UpdateTags, type: :interaction do
  describe 'execute' do
    let(:path) { file_fixture_path + '/audios/without_tags/_01_seed_of_an_idea.mp3' }
    let(:inputs) { { path: path } }

    context 'when don\'t exist songs previously' do
      it 'returns something' do
        expect(result).to eq(1)
      end
    end
  end
end
