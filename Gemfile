source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

# Defaults
gem 'rails', '~> 5.2.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jbuilder', '~> 2.5'
gem 'redis', '~> 3.0'
gem 'redis-namespace'
# /Defaults

# Essentials
# gem 'sidekiq'
# gem 'sidekiq-cron'
gem 'autoprefixer-rails'
gem 'colorize'
# gem 'faker'
gem 'rspec'
gem 'factory_bot_rails'
gem 'devise'
# / Essentials

gem "rest-client"
gem "exception_notification"
gem 'slack-notifier'
gem 'mini_magick' # Used by active_storage
gem 'bootsnap', '>= 1.1.0', require: false
gem 'parsley-rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'annotate'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'binding_of_caller'
  gem 'better_errors'
  gem 'rspec-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rails_real_favicon'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end
