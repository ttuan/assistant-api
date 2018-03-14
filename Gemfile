source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "api-ai-ruby"
gem "chatwork"
gem "config"
gem "google-api-client"
gem "mechanize"
gem "rails", "~> 5.1.5"
gem "mysql2"
gem "puma", "~> 3.7"
gem "whenever", require: false

group :development, :test do
  gem "pry"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :production, :staging do
  gem "capistrano", "3.8.2"
  gem "capistrano-bundler"
  gem "capistrano-rails"
  gem "capistrano-rvm"
  gem "capistrano-sidekiq"
  gem "capistrano-passenger"
  gem "passenger", ">= 5.0.25", require: "phusion_passenger/rack_handler"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
