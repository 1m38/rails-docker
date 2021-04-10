# pure rails env

FROM ruby:2.7

ENV LANG C.UTF-8 \
    TZ Asia/Tokyo

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && apt-get upgrade -y && apt-get install -y nodejs yarn postgresql-client

RUN echo "gem: --no-document" >> ~/.gemrc && \
    gem install rails -v 6.0.3
