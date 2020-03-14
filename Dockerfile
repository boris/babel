FROM ruby:2.6.5

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    mysql-client \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 8080
WORKDIR /usr/src/app

COPY Gemfile* ./
RUN bundle install
COPY . .

CMD ["rails", "server", "-b", "0.0.0.0", "--port", "8080"]
