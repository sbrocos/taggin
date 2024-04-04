# frozen_string_literal: true

FactoryBot.define do
  factory :album do
    title { 'MyString' }
    artist_name { 'Artist' }
    label { 'MyString' }
    upc { 'MyString' }
    release_date { '2024-03-24 13:14:12' }
    cover { Rack::Test::UploadedFile.new("spec/support/fixtures/keep_it_simple_cover.jpg", "image/jpeg") }
  end
end
