FROM ruby:2.2
ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    mysql-client \
    nodejs

RUN gem install bundler

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME