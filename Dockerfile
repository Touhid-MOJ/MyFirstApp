FROM ruby:2.7
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

# Add a script to be executed everytime the container starts.
COPY bootstrap.sh /usr/bin/
RUN chmod +x /usr/bin/bootstrap.sh
ENTRYPOINT [ "bootstrap.sh" ]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]