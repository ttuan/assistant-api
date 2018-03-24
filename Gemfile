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
gem "mina", require: false
gem "mina-puma", require: false,  github: "untitledkingdom/mina-puma"
gem "rails", "~> 5.1.5"
gem "mysql2", "0.4.10"
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

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
