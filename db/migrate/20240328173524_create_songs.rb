# frozen_string_literal: true

class CreateSongs < ActiveRecord::Migration[7.1]
  def change
    create_table :songs do |t|
      t.references :album, null: false, foreign_key: true
      t.string :title, null: false, default: ''
      t.string :isrc, null: false, default: ''
      t.integer :track_number, null: false, default: 0
      t.integer :disk_number, null: false, default: 1
      t.string :comment, null: false, default: ''
      t.string :composer, null: false, default: ''

      t.timestamps
    end
  end
end
