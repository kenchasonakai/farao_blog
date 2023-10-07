FROM ruby:3.2.2
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
RUN apt-get update -qq && apt-get install -y build-essential
RUN mkdir /app
WORKDIR /app
RUN gem install bundler
COPY . /app
