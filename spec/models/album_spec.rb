# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Album do
  subject(:album) { create(:album) }

  describe 'database columns' do
    it do
      expect(album).to have_db_column(:title).of_type(:string).with_options(null: false, default: '')
      expect(album).to have_db_column(:artist_name).of_type(:string).with_options(null: false, default: '')
      expect(album).to have_db_column(:label).of_type(:string).with_options(null: false, default: '')
      expect(album).to have_db_column(:upc).of_type(:string).with_options(null: false, default: '')
      expect(album).to have_db_column(:release_date).of_type(:datetime)
    end
  end

  describe 'associations' do
    it { expect(album).to have_many(:songs) }
  end

  describe 'validates' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:artist_name) }
    it { is_expected.to validate_presence_of(:cover) }
  end
end
