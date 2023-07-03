FROM ruby:3.2.0

RUN apt-get update -qq && \
    apt-get install -y nodejs npm postgresql-client && \
    npm install -g yarn && \
    gem install bundler

RUN mkdir /app

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . /app/
