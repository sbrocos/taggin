# frozen_string_literal: true

FactoryBot.define do
  factory :album do
    title { 'MyString' }
    label { 'MyString' }
    upc { 'MyString' }
    release_date { '2024-03-24 13:14:12' }

    after(:build) do |album|
      file_name = 'cover.jpg'
      file_path = Rails.root.join('spec', 'support', 'fixtures', file_name)
      album.cover.attach = ActiveStorage::Blob.create_and_upload!(
        io: File.open(file_path),
        filename: file_name,
        content_type: 'image/jpeg'
      )
    end
  end
end
