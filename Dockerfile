FROM ruby:2.7.0

ENV LANG C.UTF-8

WORKDIR /usr/src/app

COPY lib/airtable_poc/version.rb ./lib/airtable_poc/
COPY Gemfile .
COPY airtable-poc.gemspec .

RUN bundle check || bundle install

COPY . .

RUN gem build airtable-poc.gemspec
RUN gem install airtable-poc-0.0.1.gem

CMD ["sh", "-c", "rubocop; rspec; bash"]
