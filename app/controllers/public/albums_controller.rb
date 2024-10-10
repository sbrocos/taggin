# frozen_string_literal: true

module Public
  # Controller class to CRUD actions of Ablums
  class AlbumsController < ApplicationController
    before_action :set_album, only: :show

    # GET /albums
    def index
      @albums = Album.all
    end

    # GET /albums/1
    def show; end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end
  end
end
