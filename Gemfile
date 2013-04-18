if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

source 'http://ruby.taobao.org'

gem 'rails', '>=3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development, :test do
  gem 'sqlite3'
end

group :development do
  gem 'rspec-rails'
  gem 'debugger'
end

group :test do
  gem 'guard-rspec'
  gem 'guard-spork'
end

group :production do
  gem 'mysql2'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'rails_kindeditor', '~> 0.3.14'
gem 'social-share-button'
gem 'exception_notification'

gem "omniauth-github"
gem "omniauth-google-oauth2"
gem 'omniauth-weibo-oauth2'
gem 'omniauth-qq-connect'
gem 'omniauth-douban-oauth2' 
gem 'omniauth-identity'
gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

