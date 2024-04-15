# frozen_string_literal: true

require 'taglib'

module Songs
  class CleanTags < ActiveInteraction::Base
    string :path
    
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
  end
end
