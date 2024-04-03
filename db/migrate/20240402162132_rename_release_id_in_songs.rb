# frozen_string_literal: true

class RenameReleaseIdInSongs < ActiveRecord::Migration[7.1]
  def change
    rename_column :songs, :release_id, :album_id
  end
end
