# frozen_string_literal: true

require 'taglib'

module Songs
  # Interaction to read the ID3v2 tags from a mp3 file
  class ReadTags < ActiveInteraction::Base
    string :path

    # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
    def execute
      result = {}
      TagLib::MPEG::File.open(path) do |file|
        properties = TagLib::MPEG::Properties.new(file)
        tag = file.id3v2_tag
        cover = tag.frame_list('APIC').first
        result[:title] = tag.title
        result[:artist] = tag.artist
        result[:album] = tag.album
        result[:track_number] = tag.track
        result[:mime_type] = cover&.mime_type || ''
        result[:cover] = cover&.picture
        result[:year] = tag.year
        result[:genre] = tag.genre
        result[:comment] = tag.comment
        result[:original] = properties&.original?
        result[:copyright] = properties&.copyrighted?
      end

      result
    end
    # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
  end
end
