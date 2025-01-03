# frozen_string_literal: true

# Model Song
class Song < ApplicationRecord
  # Callbacks
  before_save :year_from_album

  # Attachments
  has_one_attached :audio, dependent: :destroy

  # Associations
  belongs_to :album

  # Scopes
  scope :ordered, -> { order(disk_number: :asc, track_number: :asc) }

  # delegation
  delegate :artist_name, to: :album

  # Validations
  validates :title, presence: true
  validates :audio, blob: { content_type: %w[audio/mpeg] }

  def previous
    album.songs.ordered.where('track_number < ?', track_number).where(disk_number:).last
  end

  private

  def year_from_album
    return if year != 0

    self.year = album.release_date.year
  end
end
