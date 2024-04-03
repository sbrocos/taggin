# frozen_string_literal: true

class CreateReleases < ActiveRecord::Migration[7.1]
  def change
    create_table :albums do |t|
      t.string :title, null: false, default: ''
      t.string :label, null: false, default: ''
      t.string :upc, null: false, default: ''
      t.timestamp :release_date

      t.timestamps
    end
  end
end
