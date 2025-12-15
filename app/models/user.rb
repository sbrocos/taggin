# frozen_string_literal: true

# Class User generate by rails 8 authenticate process
class User < ApplicationRecord
  # callbacks
  before_save :downcase_username

  # extras
  has_secure_password

  # associations
  has_many :sessions, dependent: :destroy

  # normalizes
  normalizes :email_address, with: ->(e) { e.strip.downcase }

  # validateions
  validates :email_address, :username, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  private

  def downcase_username
    self.username = username.downcase if username.present?
  end
end
