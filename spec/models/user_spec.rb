# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  subject(:user) { create(:user) }

  describe 'database columns' do
    it do
      expect(user).to have_db_column(:email_address).of_type(:string).with_options(null: false, default: '')
      expect(user).to have_db_column(:password_digest).of_type(:string).with_options(null: false, default: '')
      expect(user).to have_db_column(:username).of_type(:string).with_options(null: false, default: '')
      expect(user).to have_db_column(:artistic_name).of_type(:string).with_options(null: false, default: '')
      expect(user).to have_db_column(:composer_name).of_type(:string).with_options(null: false, default: '')
    end
  end

  describe 'associations' do
    it { expect(user).to have_many(:sessions).dependent(:destroy) }
  end

  describe 'normalizes' do
    it { expect(user).to normalize(:email_address).from(" ME@XYZ.COM\n").to("me@xyz.com") }
  end

  describe 'validations' do
    it { expect(user).to validate_presence_of(:email_address) }
    it { expect(user).to validate_presence_of(:username) }
    it { expect(user).to validate_uniqueness_of(:email_address).case_insensitive }
    it { expect(user).to validate_uniqueness_of(:username).case_insensitive }
    it { expect(user).to validate_length_of(:password).is_at_least(6) }
  end
end
