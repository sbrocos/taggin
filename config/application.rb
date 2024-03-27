require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Taggin
  class Application < Rails::Application
    config.load_defaults 7.1
    config.autoload_lib(ignore: %w(assets tasks))
    config.generators do |generate|
      generate.helper false
      generate.template_engine :slim
      # generate.orm :active_record, primary_key_type: :uuid
    end
    config.active_storage.variant_processor = :mini_magick
  end
end
