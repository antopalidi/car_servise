source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.3", ">= 7.0.3.1"

gem "sprockets-rails"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "bootsnap", require: false
gem 'caxlsx'
gem 'caxlsx_rails'
gem 'rubyzip'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "sqlite3", "~> 1.4"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

group :production do
  gem 'pg'
end
