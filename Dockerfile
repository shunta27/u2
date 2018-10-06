FROM ruby:2.5.1
ENV LANG C.UTF-8

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN apt-get update -qq && apt-get install -y \
    software-properties-common \
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