# frozen_string_literal: true

class AddYearToSong < ActiveRecord::Migration[7.1]
  def change
    add_column :songs, :year, :integer, null: false, default: 0
  end
end
