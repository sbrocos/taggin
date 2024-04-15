# frozen_string_literal: true

module Songs
  # Service to build a Song.
  # Calculate initial track_number depend of the tracks numbers of previously songs in the same album
  class BuildSong < ActiveInteraction::Base
    object :album

    def execute
      @song = @album.songs.new(track_number: new_track_number, year: set_year)
    end

    def to_model
      @song
    end

    private

    def new_track_number
      return 1 if @album.songs.empty?

      @album.songs.ordered.last.track_number + 1
    end

    def set_year
      @album.release_date.year
    end
  end
end
