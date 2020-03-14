FROM rails

EXPOSE 8080
WORKDIR /usr/src/app

COPY Gemfile* ./
RUN bundle install
COPY . .

CMD ["rails", "server", "-b", "0.0.0.0", "--port", "8080"]
