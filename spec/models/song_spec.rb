# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Song do
  subject(:song) { create(:song) }

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

  # describe 'associations' do
  #   it do
  #     expect(song).to belong_to('release')
  #   end
  # end

  describe 'attachments' do
    it { should have_one_attached(:audio) }
  end

  describe '#ordered' do
    subject(:ordered) { described_class.ordered }

    before do
      song1
      song2
    end

    context 'when have only one disc' do
      let(:song1) { create(:song, track_number: 1) }
      let(:song2) { create(:song, track_number: 2) }

      it 'returns array with correct ordered songs' do
        expect(ordered).to eq([song1, song2])
      end
    end

    context 'when you have two disc and the same track number' do
      let(:song1) { create(:song, track_number: 1, disk_number: 1) }
      let(:song2) { create(:song, track_number: 1, disk_number: 2) }

      it 'returns array with ordered by track and disc' do
        expect(ordered).to eq([song1, song2])
      end
    end
  end

  describe '.previous' do
    subject(:previous) { song.previous }

    let(:release) { create(:release) }
    let(:song) { create(:song, track_number: 3, release:) }
    let(:song2) { create(:song, track_number: 2, release:) }

    before do
      song2
      create(:song, track_number: 1, release:)
      create(:song, track_number: 1, release:)
      create(:song, track_number: 2, release:, disk_number: 2)
      create(:song, track_number: 2)
    end

    it 'returns song with track number 2 of the same release and same disk' do
      expect(previous).to eq(song2)
    end
  end
end
