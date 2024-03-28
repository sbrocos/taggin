# frozen_string_literal: true

FactoryBot.define do
  factory :release do
    title { 'MyString' }
    label { 'MyString' }
    upc { 'MyString' }
    release_date { '2024-03-24 13:14:12' }

    after(:build) do |release|
      release.cover.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'cover.jpg')),
        filename: 'cover.jpg',
        content_type: 'image/jpeg'
      )
    end
  end
end