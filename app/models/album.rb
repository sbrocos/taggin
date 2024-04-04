# frozen_string_literal: true

# Represents a album of a product.
class Album < ApplicationRecord
  has_one_attached :cover do |attachable|
    attachable.variant :thumb, resize: '100x100'
    attachable.variant :medium, resize: '400x400'
  end

  # Associations
  has_many :songs, dependent: :destroy

  # Validations
  validates :title, :artist_name, presence: true
  validates :cover, presence: true
end
