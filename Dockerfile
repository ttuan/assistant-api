FROM ruby:2.5.0
MAINTAINER ttuan <tuantv.nhnd@gmail.com>

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs vim cron

ENV APP_HOME /AssistantAPI

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD Gemfile $APP_HOME/Gemfile
ADD Gemfile.lock $APP_HOME/Gemfile.lock
RUN gem install bundler
RUN bundle install
ADD . $APP_HOME
