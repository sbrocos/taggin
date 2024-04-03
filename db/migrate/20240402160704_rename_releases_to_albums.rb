# frozen_string_literal: true

class RenameReleasesToAlbums < ActiveRecord::Migration[7.1]
  def change
    rename_table :releases, :albums
  end
end
