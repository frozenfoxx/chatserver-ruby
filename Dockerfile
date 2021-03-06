# Base image
FROM ruby:3-alpine3.13

# Information
LABEL maintainer="FrozenFOXX <frozenfoxx@churchoffoxx.net>"

# Environment variables
ENV BUILD_DEPENDENCIES="build-base ruby-dev" \
  HOST="0.0.0.0" \
  PORt="8080"

WORKDIR /usr/src/app

# Throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

# Install build dependencies
RUN apk -U --no-cache --virtual .build-deps \
  add ${BUILD_DEPENDENCIES}

# Install
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

# Cleanup build dependencies
RUN apk del .build-deps

ENTRYPOINT [ "./entrypoint.sh" ]