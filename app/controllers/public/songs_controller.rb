# frozen_string_literal: true

module Public
  # Controller for CRUD actions of songs
  class SongsController < ApplicationController
    before_action :set_album

    # GET /songs/
    def index; end

    # GET /songs/1
    def show; end


    private

    def set_album
      @album = Album.find(params[:album_id])
    end
  end
end
