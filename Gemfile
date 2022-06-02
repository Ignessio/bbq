source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git'}

ruby '3.0.2'

gem 'activestorage', '~> 6.1'
gem 'aws-sdk-s3', '~> 1.113', require: false
gem 'devise'
gem 'devise-i18n'
gem 'image_processing', '~> 1.12'
gem 'mailjet', '~> 1.6'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'pundit', '~> 2.2'
gem 'rails', '~> 6.1.4', '>= 6.1.4.4'
gem 'rails-i18n'
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'letter_opener', '~> 1.8'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 5.1'
end

group :development do
  gem 'capistrano', '~> 3.17'
  gem 'capistrano-passenger', '~> 0.2'
  gem 'capistrano-rails', '~> 1.4'
  gem 'capistrano-rbenv', '~> 2.1', '>= 2.1.4'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'web-console', '>= 4.1.0'
end
