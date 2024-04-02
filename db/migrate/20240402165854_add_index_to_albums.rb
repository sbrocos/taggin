# frozen_string_literal: true

class AddIndexToAlbums < ActiveRecord::Migration[7.1]
  def change
    add_index :albums, :id
  end
end
