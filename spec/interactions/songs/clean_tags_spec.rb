# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Songs::CleanTags, type: :interaction do
  describe 'execute' do
    before do
      original_path = "#{file_fixture_path}/audios/with_tags/01_seed_of_an_idea.mp3"
      FileUtils.cp(original_path, destiny_path)
    end

    after { FileUtils.rm destiny_path }

    let(:destiny_path) { Rails.root.join('tmp/songs/song.mp3').to_s }
    let(:empty_hash) do
      {
        title: '', artist: '', album: '', track_number: 0, mime_type: '', cover: nil, year: 0, genre: '',
        comment: '', original: true, copyright: false
      }
    end

    context 'when don\'t exist songs previously' do
      let(:inputs) { { path: '' } }

      it 'returns something' do
        expect(errors).to eq({ path: ['can\'t be blank'] })
      end
    end

    context 'when everything it is ok' do
      let(:inputs) { { path: destiny_path } }

      it 'returns something' do
        expect(result).to be_truthy
        read = Songs::ReadTags.run(inputs)
        expect(read.result).to eq(empty_hash)
      end
    end
  end
end
