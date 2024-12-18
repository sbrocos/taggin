# frozen_string_literal: true

require 'rails_helper'
require 'active_storage_validations/matchers'

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
    it do
      expect(album).to validate_presence_of(:title)
      expect(album).to validate_presence_of(:artist_name)
      expect(album).to validate_presence_of(:cover)
    end

    it { is_expected.to validate_attached_of(:cover) }
    it { is_expected.to validate_aspect_ratio_of(:cover).allowing(:square) }
    it { is_expected.to validate_dimensions_of(:cover).width_min(400) }
    it { is_expected.to validate_dimensions_of(:cover).width_max(1200) }
    it { is_expected.to validate_content_type_of(:cover).allowing('image/png', 'image/jpeg', 'image/gif') }
  end
end
