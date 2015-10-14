source 'https://rubygems.org'
ruby '2.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
# Use mysql2 as the database for Active Record
gem 'mysql2', '~> 0.3.18'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'bootstrap-sass', '~> 3.3.5'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'devise'
gem "paperclip", "~> 4.3"

group :development, :test do
  gem 'rspec-rails'
  gem 'rspec-mocks'
  gem 'shoulda-matchers'
  gem 'capybara', '2.5.0'
  gem 'capybara-webkit'
  gem 'capybara-screenshot'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'database_cleaner'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  gem 'unicorn'
end

group :development do
  gem 'thin'
  #Open sent emails in browser
  gem "letter_opener"
  # DIsable assets in logs
  gem 'quiet_assets'
  gem "better_errors"
  gem "binding_of_caller"
  gem 'meta_request'
  gem 'capistrano',         require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-unicorn',     require: false
  gem 'rvm1-capistrano3', require: false
end
