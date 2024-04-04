# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

keep_it_simple = Album.find_or_initialize_by(title: 'Keep it simple', artist_name: 'BROCOS', label: 'Ichi Records', upc: '', release_date: Date.new(2023, 6, 30))
unless keep_it_simple.cover.attached?
  keep_it_simple.cover = File.open('spec/fixtures/files/cover.jpg')
end

keep_it_simple.save!
# create the songs of Keep it Simple
keep_it_simple.songs.destroy_all
keep_it_simple.songs.create!(title: 'Seed of an idea', track_number: 1, comment: 'Born a idea to be a song.')
keep_it_simple.songs.create!(title: 'One Thousand and One Attempts', track_number: 2, comment: 'The initial idea evolves step to step.')
keep_it_simple.songs.create!(title: 'Iniciando Aventura', track_number: 3, comment: 'The evolution of the idea is important, now it has real groove. This song was the first single of the EP')
keep_it_simple.songs.create!(title: 'Sun & Rain', track_number: 4, comment: 'This it\'s a new idea, new concept closer to Hip Hop sound but with eletronic sounds.')
keep_it_simple.songs.create!(title: 'No looking back', track_number: 5, comment: 'Another attempt to use electronic music with grooves from Hip Hop')
keep_it_simple.songs.create!(title: 'Grow up', track_number: 6, comment: 'The Initial Idea it\'s finished with groove and a lott of changes. Now it\'s a new Idea')

