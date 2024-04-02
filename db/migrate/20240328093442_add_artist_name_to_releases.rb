# frozen_string_literal: true

class AddArtistNameToReleases < ActiveRecord::Migration[7.1]
  def change
    add_column :albums, :artist_name, :string, null: false, default: ''
  end
end
