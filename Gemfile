source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails', '4.2.5'
gem 'mysql2', '~> 0.4.2'
gem 'sass-rails', '~> 5.0.4'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 2.7.2'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~> 2.5.3'
gem 'jquery-rails', '~> 4.0.5'
gem 'jquery-ui-rails', '~> 5.0.5'
gem 'jquery-turbolinks', '~> 2.1.0'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'coffee-rails', '~> 4.1.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.3.2'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.1', group: :doc
#Best in Place is a jQuery based AJAX Inplace-Editor that takes profit of RESTful server-side controllers to allow users to edit stuff with no need of forms.
gem 'best_in_place'
gem 'rails-jquery-autocomplete'
gem 'haml', '~> 4.0.7'
gem 'toastr_rails'

gem 'devise', '~> 3.5.2'
gem 'devise_invitable', '~> 1.5.3'
gem 'paperclip', '~> 4.3.2'

group :development, :test do
  gem 'rspec-rails'
  gem 'rspec-mocks'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'database_cleaner'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'
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
  gem 'rvm1-capistrano3', require: false
  gem 'capistrano3-unicorn', require: false
end
