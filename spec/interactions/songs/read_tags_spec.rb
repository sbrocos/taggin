# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Songs::ReadTags, type: :interaction do
  describe 'execute' do
    let(:path) { file_fixture_path + '/audios/with_tags/01_seed_of_an_idea.mp3' }
    let(:inputs) { { path: path } }

    context 'when don\'t exist songs previously' do
      let(:example) do
        {
          title: 'Seed of an Idea',
          artist: 'Brocos',
          album: 'Keep it Simple',
          track_number: 1,
          year: 2023,
          genre: 'Electronic',
          comment: '',
          original: true,
          copyright: false,
          mime_type: 'image/jpeg'
        }
      end
      it 'returns something' do
        expect(result.except(:cover)).to eq(example)
      end
    end
  end
end
