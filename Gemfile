source 'https://rubygems.org'

gem 'rails', '~> 3.2.13'

group :production do
  gem 'pg'
  gem 'rmagick', '~> 2.13.2'
end

group :development, :test do
   gem 'sqlite3'
   gem 'letter_opener' #email testing in development
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.2'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'jquery-rails'
gem "heroku"

#user registrations, invitations & authorizations
gem "devise"
gem "devise_invitable"
gem "cancan"

#styling
gem 'bootstrap-sass', '~> 2.3.2.0'
gem "bootstrap-will_paginate"
gem "haml"
gem 'haml-rails'
gem 'simple_form'


gem 'newrelic_rpm'

#comments
gem 'acts_as_commentable_with_threading'


=begin
gem 'devise-async'
foreman
intercom
figaro
uglifier
#   gem 'rspec-rails'
#   gem 'guard-rspec'


#A/B spilt testing
gem 'split', require: 'split/dashboard'


=end