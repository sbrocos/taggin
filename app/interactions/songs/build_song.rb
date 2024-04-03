# frozen_string_literal: true

module Songs
  class BuildSong  < ActiveInteraction::Base
    object :album

    def execute
      @song = @album.songs.new(track_number: new_track_number)
    end

    def to_model
      @song
    end

    private

    def new_track_number
      return 1 if @album.songs.empty?
      
      @album.songs.ordered.last.track_number + 1
    end
  end
end
