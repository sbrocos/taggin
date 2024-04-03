# frozen_string_literal: true

module RSpec
  module Rails
    module FixtureFileUploadSupport
      # Class to improve to upload files to text attachments
      class RailsFixtureFileWrapper
        class << self
          attr_accessor :file_fixture_path
        end
      end
    end
  end
end
