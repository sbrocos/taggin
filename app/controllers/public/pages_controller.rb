# frozen_string_literal: true

module Public
  # Class: PagesController < ApplicationController
  class PagesController < ApplicationController
    allow_unauthenticated_access
    def home; end
  end
end
