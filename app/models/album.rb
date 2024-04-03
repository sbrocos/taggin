# frozen_string_literal: true

# Represents a album of a product.
class Album < ApplicationRecord
  has_one_attached :cover do |attachable|
    attachable.variant :thumb, resize: '100x100'
    attachable.variant :medium, resize: '400x400'
  end

  # Associations
  has_many :songs

  # Validations
  validates :title, :artist_name, presence: true
  validates :cover, attached: true,
            content_type: [:png, :jpg, :jpeg],
            aspect_ratio: :square,
            dimension: { width: { min: 1600, max: 3000 } }

end
