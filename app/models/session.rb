# frozen_string_literal: true

# Class Session generate by rails 8 authenticate process
class Session < ApplicationRecord
  belongs_to :user
end
