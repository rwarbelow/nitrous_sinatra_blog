source 'https://rubygems.org'
ruby '2.0.0'

gem 'sinatra'
gem 'activerecord'
gem 'sinatra-activerecord'
gem 'sinatra-flash'
gem 'sinatra-redirect-with-flash'

group :development do
  gem 'sqlite3'
  gem 'tux'
end

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'rspec', '2.13.0'
  gem 'guard', '1.7.0'
  gem 'guard-rspec', '2.5.2'
  gem 'guard-spork', '1.4.2'
  gem 'spork', '0.9.2'
end

group :test do
  gem 'capybara', '1.1.2'
  gem 'growl', '1.0.3'
  gem 'rb-fsevent', '0.9.1', :require => false
end