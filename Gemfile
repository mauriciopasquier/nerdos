source 'https://rubygems.org'

gem 'rails', '3.2.9'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'rails-i18n'
gem 'fugue_icons_rails'
gem 'yaml_db'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', '~> 0.10.0' # la 0.11 no me compila
  gem 'uglifier'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
gem 'spree', '~> 1.2.2'
gem 'spree_auth_devise',  github: 'spree/spree_auth_devise', branch: '1-2-stable'
gem 'spree_i18n',         github: 'spree/spree_i18n'
gem 'spree_static_content', github: 'spree/spree_static_content', branch: '1-2-stable'

group :development do
  gem 'pry'
  gem 'pry-rails'
  gem 'hirb'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'minitest'
  gem 'factory_girl_rails'
end
