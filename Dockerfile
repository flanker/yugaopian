FROM ruby:2.2

RUN apt-get update
RUN apt-get install -y vim nodejs

WORKDIR /app
ADD Gemfile /app/
ADD Gemfile.lock /app/
RUN bundle install --jobs 8 --retry 3
ADD . /app/
