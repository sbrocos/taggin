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
  # validates :cover, attached: true
  #                  content_type: %i[png jpeg],
  #                  aspect_ratio: :square,
  #                  dimension: { width: { min: 400, max: 1200 } }
end
