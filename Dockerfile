# Define build argument for Ruby version
ARG RUBY_VERSION=2

# Use the specific Ruby version provided by the build argument
FROM ruby:${RUBY_VERSION}

# Install the specified Bundler version
# BUNDLER_VERSION is passed in as a build arg, this is just the default
ARG BUNDLER_VERSION=2.4.22
RUN gem install bundler -v ${BUNDLER_VERSION} --no-document

ENV BUNDLE_GEMFILE=/tmp/Gemfile
COPY Gemfile $BUNDLE_GEMFILE
RUN bundle install -j 4

CMD ["/bin/sh"]
