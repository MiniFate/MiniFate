FROM alpine:3.13
RUN apk add --update ruby
RUN apk add \
    build-base \
    ruby-dev \
    libffi-dev \
    ruby-etc \
    zlib-dev

RUN gem install bundler
ENV BUNDLE_GEMFILE=/tmp/Gemfile
COPY Gemfile $BUNDLE_GEMFILE
RUN bundle install -j 4

CMD ["/bin/sh"]
