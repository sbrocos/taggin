# frozen_string_literal: true

FactoryBot.define do
  factory :album do
    title { 'MyString' }
    artist_name { 'Artist' }
    label { 'MyString' }
    upc { 'MyString' }
    release_date { '2024-03-24 13:14:12' }
    cover { File.open('spec/fixtures/cover.jpg') }
  end
end
