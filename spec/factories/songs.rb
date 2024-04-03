# frozen_string_literal: true

FactoryBot.define do
  factory :song do
    album
    title { 'MyString' }
    isrc { 'MyString' }
    track_number { 1 }
    disk_number { 1 }
    comment { 'MyString' }
    composer { 'MyString' }
  end
end
