source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'friendly_id'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', group: :development # Added development group.
gem 'pg', group: :production # Added postgres and made it production only.
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.6'

gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'duktape'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1', '>= 3.1.11'

gem 'jquery-rails', '~> 4.2', '>= 4.2.2'
gem 'jquery-ui-rails', '~> 5.0', '>= 5.0.5'
gem 'paperclip'
gem 'trix'
gem 'shrine'
gem 'local_time'
gem 'will_paginate', '~> 3.1', '>= 3.1.6'
gem 'will_paginate-bootstrap', '~> 1.0', '>= 1.0.1'
gem 'simple_form'

gem 'aws-sdk'
gem 'listen', '~> 3.1', '>= 3.1.1'

# gem 'rails_12factor', group: :production

gem 'mini_magick', '~> 4.5', '>= 4.5.1'

gem 'image_processing'

gem 'font-awesome-sass', '~> 4.6', '>= 4.6.2'
gem 'gritter', '~> 1.2'
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.14.30'
gem 'devise', '~> 4.2'
gem 'petergate', '~> 1.6', '>= 1.6.3'

gem 'exifr', '~> 1.2', '>= 1.2.5'

gem 'geocoder', '~> 1.3', '>= 1.3.7'

gem 'webpacker', '~> 4.x'

gem 'httparty', '~> 0.13.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'rails-erd'
  gem 'railroady'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
