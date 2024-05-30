# frozen_string_literal: true

require 'taglib'

module Songs
  # Interaction to update the ID3v2 tags from a mp3 file
  class UpdateTags < ActiveInteraction::Base
    object :song

    def execute
      TagLib::MPEG::File.open(path) do |file|
        tag = file.id3v2_tag
        tag.title = song.title
        tag.artist = song.artist_name
      end
    end
  end
end
