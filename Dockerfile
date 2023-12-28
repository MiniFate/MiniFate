FROM ruby:2

RUN gem install bundler -v 2.4.22
ENV BUNDLE_GEMFILE=/tmp/Gemfile
COPY Gemfile $BUNDLE_GEMFILE
RUN bundle install -j 4

CMD ["/bin/sh"]
