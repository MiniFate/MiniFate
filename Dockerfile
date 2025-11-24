# Define build argument for Ruby version
ARG RUBY_VERSION=2

# Use the specific Ruby version provided by the build argument
FROM ruby:${RUBY_VERSION}

# Install the specified Bundler version
# BUNDLER_VERSION is passed in as a build arg, this is just the default
ARG BUNDLER_VERSION=2.4.22
RUN gem install bundler -v ${BUNDLER_VERSION} --no-document

# Copy .ruby-version into the image (documentation)
COPY .ruby-version .ruby-version

# Set working directory
WORKDIR /workspace

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Configure Bundler to respect the lockfile strictly (frozen)
RUN bundle config set --global frozen 1

# Install gems based strictly on Gemfile.lock
RUN bundle install --jobs 4

# No CMD needed, will be provided by docker run
