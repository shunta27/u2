source 'https://rubygems.org'
ruby '2.5.1'

gem 'rails', github: 'rails/rails', branch: '4-2-stable'
gem 'mysql2', '~> 0.3.13'
gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'bcrypt', '~> 3.1.12'
gem 'kaminari'
gem 'draper'
gem 'devise'
gem "bulma-rails"
gem 'twitter'
gem 'pundit'
gem "paranoia", "~> 2.2"
gem 'exception_notification'
gem 'slack-notifier'
gem 'google-analytics-rails'
gem 'carrierwave'
gem 'carrierwave-ftp', :require => 'carrierwave/storage/ftp/all'
gem 'rmagick'

group :doc do
  gem 'sdoc', '~> 0.4.0'
end

group :development do
  gem 'spring'
end

group :development, :test do
  gem 'rubocop', require: false
  gem 'rspec-rails'
  gem 'faker'
  gem 'pry-byebug'
  # gem 'debugger'
end

group :production do
  gem 'rails_12factor'
end