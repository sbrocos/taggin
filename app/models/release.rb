# frozen_string_literal: true

class Release < ApplicationRecord
  has_one_attached :cover do |attachable|
    attachable.variant :thumb, resize: '100x100'
    attachable.variant :medium, resize: '400x400'
  end

  validates :cover, presence: true
end
