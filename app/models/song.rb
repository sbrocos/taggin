# frozen_string_literal: true

class Song < ApplicationRecord
  # Associations
  belongs_to :release

  # Scopes
  scope :ordered, -> { order(track_number: :asc, disk_number: :asc) }

  def previous
    release.songs.ordered.where('track_number < ?', track_number).where(disk_number: disk_number).last
  end
end
