# frozen_string_literal: true

class Song < ApplicationRecord
  # Attachments
  has_one_attached :audio

  # Associations
  belongs_to :album

  # Scopes
  scope :ordered, -> { order(disk_number: :asc, track_number: :asc) }

  def previous
    album.songs.ordered.where('track_number < ?', track_number).where(disk_number: disk_number).last
  end
end