# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email_address { Faker::Internet.email }
    password { 'password123' }
    username { Faker::Internet.user_name }
    artistic_name { Faker::Artist.name }
  end
end
