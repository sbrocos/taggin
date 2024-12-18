# frozen_string_literal: true

FactoryBot.define do
  factory :album do
    title { 'MyTitle' }
    artist_name { 'MYArtist' }
    label { 'MyLabel' }
    upc { 'MyUPC' }
    release_date { '2024-03-24 13:14:12' }
    cover { File.open('spec/fixtures/files/cover.jpg') }
  end
end
