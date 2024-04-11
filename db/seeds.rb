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

file_fixture_path = Rails.root.join('spec/fixtures/files')
audio_fixture_path = file_fixture_path.join('audios/with_tags/')

keep_it_simple = Album.find_or_initialize_by(title: 'Keep it simple', artist_name: 'BROCOS', label: 'Ichi Records',
                                             upc: '', release_date: Date.new(2023, 6, 30))
keep_it_simple.cover = File.open(file_fixture_path.join('cover.jpg')) unless keep_it_simple.cover.attached?
keep_it_simple.save!
keep_it_simple.songs.destroy_all
Rails.logger.debug 'Album is processed.'

# create the songs of Keep it Simple
songs = [
  {
    title: 'Seed of and idea',
    track_number: 1,
    comment: 'Born a idea to be a song.',
    audio: File.open("#{audio_fixture_path}01_seed_of_an_idea.mp3")
  },
  {
    title: 'One Thousand and One Attempts',
    track_number: 2,
    comment: 'The initial idea evolves step to step.',
    audio: File.open("#{audio_fixture_path}02_one_thounsend_and_one_attempts.mp3")
  },
  {
    title: 'Iniciando Aventura',
    track_number: 3,
    comment: 'The evolution of the idea is important, now it has real groove. This song was the first single of the EP',
    audio: File.open("#{audio_fixture_path}03_iniciando_aventura.mp3")
  },
  {
    title: 'Sun & Rain',
    track_number: 4,
    comment: 'This it\'s a new idea, new concept closer to Hip Hop sound but with eletronic sounds.',
    audio: File.open("#{audio_fixture_path}04_sun_and_rain.mp3")
  },
  {
    title: 'No looking back',
    track_number: 5,
    comment: 'Another attempt to use electronic music with grooves from Hip Hop.',
    audio: File.open("#{audio_fixture_path}05_no_looking_back.mp3")
  },
  {
    title: 'Grow up',
    track_number: 6,
    comment: 'The Initial Idea it\'s finished with groove and a lott of changes. Now it\'s a new Idea',
    audio: File.open("#{audio_fixture_path}06_grow_up.mp3")
  }
]

songs.each do |song|
  result = keep_it_simple.songs.find_or_create_by!(song.except(:audio))
  result.audio = song[:audio] unless result.audio.attached?
  result.save!

  Rails.logger.debug { "#{song[:title]} processed." }
end
