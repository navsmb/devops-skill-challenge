FROM ruby:2.3.1

WORKDIR /usr/src/app

RUN gem install rails -v 4.2

COPY Gemfile Gemfile.lock ./

RUN bundle install

RUN apt-get update \
  && apt-get install -y nodejs

COPY . .

CMD ["rails", "s", "-b", "0.0.0.0", "-p", "4000"]
