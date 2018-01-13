FROM ruby:2.5.0
WORKDIR /usr/src/myapp
ADD ./Gemfile Gemfile
ADD app.rb /usr/src/myapp/app.rb
RUN bundle install
