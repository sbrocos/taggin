# frozen_string_literal: true

# Controller for CRUD actions of songs
class SongsController < ApplicationController
  before_action :set_album
  before_action :set_song, only: %i[edit update destroy]

  # GET /songs/new
  def new
    @song = ::Songs::BuildSong.run(album: @album).result
  end

  # GET /songs/1/edit
  def edit; end

  # POST /songs
  def create
    @song = @album.songs.new(song_params)

    if @song.save
      respond_to do |format|
        format.html { redirect_to @album, notice: t('private.songs.created') }
        format.turbo_stream { flash.now[:notice] = t('private.songs.created') }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /songs/1
  def update
    if @song.update(song_params)
      respond_to do |format|
        format.html { redirect_to @album, notice: t('private.songs.updated'), status: :see_other }
        format.turbo_stream { flash.now[:notice] = t('private.songs.updated') }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /songs/1
  def destroy
    @song.destroy!
    redirect_to songs_url, notice: t('priavet.songs.destroyed'), status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_song
    @song = @album.songs.find(params[:id])
  end

  def set_album
    @album = Album.find(params[:album_id])
  end

  # Only allow a list of trusted parameters through.
  def song_params
    params.require(:song).permit(:album_id, :title, :isrc, :track_number, :disk_number, :comment, :composer)
  end
end
