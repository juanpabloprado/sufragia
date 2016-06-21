FROM ruby:2.2.5

ENV PATH=/usr/src/app/bin:$PATH RAILS_ENV=production RACK_ENV=production

ADD . /usr/src/app
WORKDIR /usr/src/app

# Clean up un-needed files:
RUN rm -rf .dockerignore Dockerfile tmp/cache/* tmp/pids/* log/* dev-entrypoint.sh docker-compose.yml *.env .env examples

# Run bundle install
RUN bundle install --deployment --without development test

# Precompile assets for production
RUN DATABASE_URL=postgres://postgres:c@postgres.example.com:5432/blah \
    rake assets:precompile

EXPOSE 80

CMD ["rails", "server", "-p", "80", "-b", "0.0.0.0"]
