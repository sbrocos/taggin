# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Release do
  subject(:release) { create(:release) }

  describe 'database columns' do
    it do
      expect(release).to have_db_column(:title).of_type(:string).with_options(null: false, default: '')
      expect(release).to have_db_column(:label).of_type(:string).with_options(null: false, default: '')
      expect(release).to have_db_column(:upc).of_type(:string).with_options(null: false, default: '')
      expect(release).to have_db_column(:release_date).of_type(:datetime)
    end
  end

  describe 'validates' do
    it do
      expect(release).to validate_presence_of(:cover)
    end
  end
end
