# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.3.0'

gem 'cssbundling-rails'
gem 'jsbundling-rails'
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1.3'
gem 'redis', '>= 4.0.1'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
# gem "kredis"
# gem "bcrypt", "~> 3.1.7"

gem 'slim-rails', '~> 3.6'
gem 'tailwindcss-rails'
# gem "barkick" for generate UPC codes
gem 'simple_form'
gem 'simple_form-tailwind'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

gem 'active_interaction', '~> 5.3'
gem 'active_storage_validations'
gem 'bootsnap', require: false
gem 'image_processing', '~> 1.2'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'database_cleaner', '~> 2.0'
  gem 'debug', platforms: %i[mri windows]
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 6.0'
  gem 'rubocop', require: false
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem 'rubocop-capybara', require: false
  gem 'rubocop-rails', '~> 2.23.1', require: false
  gem 'rubocop-rspec', require: false
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '5.3'
  gem 'simplecov', require: false
end
