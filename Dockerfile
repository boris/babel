FROM ruby:2.6.5

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    default-libmysqlclient-dev \
    nodejs \
    libnode-dev \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 8080
WORKDIR /usr/src/app

COPY Gemfile* ./
RUN bundle install
COPY . .
ENV RAILS_ENV production

CMD bundle exec rails db:migrate && bundle exec rake assets:precompile && bundle exec rails server -b 0.0.0.0 --port 8080
