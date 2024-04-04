# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Song do
  subject(:song) { create(:song, album:) }

  let(:album) {  create(:album) }

  # rubocop:disable RSpec/ExampleLength, RSpec/MultipleExpectations
  describe 'database columns' do
    it do
      expect(song).to have_db_column(:title).of_type(:string).with_options(null: false, default: '')
      expect(song).to have_db_column(:isrc).of_type(:string).with_options(null: false, default: '')
      expect(song).to have_db_column(:track_number).of_type(:integer).with_options(null: false, default: 0)
      expect(song).to have_db_column(:disk_number).of_type(:integer).with_options(null: false, default: 1)
      expect(song).to have_db_column(:comment).of_type(:string).with_options(null: false, default: '')
      expect(song).to have_db_column(:composer).of_type(:string).with_options(null: false, default: '')
    end
  end
  # rubocop:enable RSpec/ExampleLength, RSpec/MultipleExpectations

  describe 'associations' do
    it do
      expect(song).to belong_to('album')
    end
  end

  # describe 'attachments' do
  #   it { should have_one_attached(:audio) }
  # end

  describe 'validates' do
    it do
      expect(album).to validate_presence_of(:title)
      expect(album).to validate_presence_of(:artist_name)
    end
  end

  describe '#ordered' do
    subject(:ordered) { described_class.ordered }


    context 'when have only one disc' do
      let(:song1) { create(:song, track_number: 1, album:) }
      let(:song2) { create(:song, track_number: 2, album:) }

      it 'returns array with correct ordered songs' do
        expect(ordered).to eq([song, song2])
      end
    end

    context 'when you have two disc and the same track number' do
      let(:song1) { create(:song, track_number: 1, disk_number: 1, album:) }
      let(:song2) { create(:song, track_number: 1, disk_number: 2, album:) }

      it 'returns array with ordered by track and disc' do
        expect(ordered).to eq([song1, song2])
      end
    end
  end

  describe '.previous' do
    subject(:previous) { song.previous }

    let(:album) { create(:album) }
    let(:song) { create(:song, track_number: 3, album:) }
    let(:song2) { create(:song, track_number: 2, album:) }

    before do
      song2
      create(:song, track_number: 1, album:)
      create(:song, track_number: 1, album:)
      create(:song, track_number: 2, album:, disk_number: 2)
      create(:song, track_number: 2)
    end

    it 'returns song with track number 2 of the same album and same disk' do
      expect(previous).to eq(song2)
    end
  end
end
