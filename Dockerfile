FROM ruby:3.2.2 as base

ENV RAILS_ENV=production\
    BUNDLE_DEPLOYMENT=1\
    BUNDLE_WITHOUT=development:test\
    BUNDLE_PATH=/usr/local/bundle

# Rails app lives here
WORKDIR /rails

# Install packages needed to build gems
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libvips pkg-config

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy application code
COPY . .

# Entrypoint prepares the database.
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
