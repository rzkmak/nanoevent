FROM ruby:2.5.3
RUN mkdir /opt/nanoevent
RUN gem install bundler -v 2.0.1
COPY . /opt/nanoevent
VOLUME /opt/nanoevent
WORKDIR /opt/nanoevent
RUN bundle install
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
