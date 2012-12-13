source 'https://rubygems.org'

gem 'rails', '3.2.8' # standard rails install
gem 'bootstrap-sass', '2.0.4' # Bootstrap SASS/CSS
gem 'bcrypt-ruby', '3.0.1' # used for Authentication

group :development, :test do
  gem 'sqlite3', '1.3.5' # for SQL - database management. Easier than postgres, but generally it's bad to use separate development db as production.
  gem 'rspec-rails', '2.11.0' # for RSpec – testing environment. RSpec itself is dependency of gem so no separate install needed.
  gem 'guard-rspec', '1.2.1' # for RSpec testing, Guard monitors changes in the filesystem so that only the tests in xyz_spec.rb run.
  gem 'guard-spork', '1.2.0' # connects Guard and Spork
  gem 'spork', '0.9.2' # speeds up testing by running a test server in the background
  gem 'factory_girl_rails', '4.1.0' # for testing, models real end-user behaviour
end

group :development do
  gem 'annotate', '2.5.0'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.5'
  gem 'coffee-rails', '3.2.2'
  gem 'uglifier', '1.2.3'
end

gem 'jquery-rails', '2.0.2'

group :test do #:xyz this is a symbol (can be used as a key but not critical)
  gem 'capybara', '1.1.2' # simulates user interaction for testing (e.g. filling form)
  gem 'rb-fsevent', '0.9.1', :require => false
  gem 'growl', '1.0.3'
end 

group :production do
  gem 'pg', '0.12.2'
end