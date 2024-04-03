require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Taggin
  class Application < Rails::Application
    config.load_defaults 7.1
    config.autoload_lib(ignore: %w(assets tasks))
    config.autoload_paths += %W(#{config.root}/interactions)
    config.generators do |generate|
      generate.helper false
      generate.template_engine :slim
    end
    config.active_storage.variant_processor = :mini_magick
  end
end
