# frozen_string_literal: true
require 'taglib'

module Songs
  # Interaction to clean the ID3v2 tags of a mp3 file
  class CleanTags < ActiveInteraction::Base
    string :path

    validates :path, presence: true

    # rubocop:disable Metrics/MethodLength
    def execute
      TagLib::MPEG::File.open(path) do |file|
        tag = file.id3v2_tag
        tag.remove_frames('APIC')
        tag.title = ''
        tag.artist = ''
        tag.album = ''
        tag.track = 0
        tag.year = 0
        tag.genre = ''
        tag.comment = ''
        file.save
      end
    end
    # rubocop:enable Metrics/MethodLength
  end
end
