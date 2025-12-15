# frozen_string_literal: true

# Class Current generate by rails 8 authenticate process
class Current < ActiveSupport::CurrentAttributes
  attribute :session
  delegate :user, to: :session, allow_nil: true
end
