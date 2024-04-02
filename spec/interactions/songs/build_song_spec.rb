# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Songs::BuildSong, type: :interaction do
  describe 'execute' do
    let(:album) { create(:album) }
    let(:inputs) { { album: } }

    context 'when don\'t exist songs previously' do
      it 'returns a song with track number equal 1' do
        expect(result.track_number).to eq(1)
      end
    end

    context 'when exist a song previously with a minor track number' do
      before { create(:song, album:, track_number: 1) }

      it 'returns a song with track number equal 2' do
        expect(result.track_number).to eq(2)
      end
    end
  end
end
