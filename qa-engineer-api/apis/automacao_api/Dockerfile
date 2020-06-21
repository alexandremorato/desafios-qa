FROM ruby:2.6.6-alpine3.12

RUN apk update \
    && apk upgrade \
    && apk add --update \
    tzdata \
    git \
    linux-headers \
    build-base \
    imagemagick \
    imagemagick-dev \
    freetds-dev \
    && rm -rf /var/cache/apk/*

RUN mkdir /app
WORKDIR /app
COPY Gemfile ./Gemfile
RUN gem install bundler
RUN bundle install
COPY . .