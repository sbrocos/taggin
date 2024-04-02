# frozen_string_literal: true

FactoryBot.define do
  factory :album do
    title { 'MyString' }
    label { 'MyString' }
    upc { 'MyString' }
    release_date { '2024-03-24 13:14:12' }
    cover { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'cover.jpg')) }

    # after(:build) do |album|
    #   album.cover.attach(
    #     io: File.open(),
    #     filename: 'cover.jpg',
    #     content_type: 'image/jpeg'
    #   )
    # end
  end
end
