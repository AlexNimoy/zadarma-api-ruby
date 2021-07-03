# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

group :test do
  gem 'rspec', '~> 3.0'
  gem 'vcr', '~> 5.1'
  gem 'webmock', '~> 3.8', '>= 3.8.2'
end

group :test, :development do
  gem 'pry'
  gem 'rubocop'
  gem 'rubocop-rspec', require: false
end

gemspec
