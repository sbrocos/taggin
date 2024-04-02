# frozen_string_literal: true

class AddIndexToSongs < ActiveRecord::Migration[7.1]
  def change
    add_index :songs, :id
  end
end
