ENV['RACK_ENV'] = 'test'

require 'bundler/setup'
Bundler.setup

require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

require 'airtable_poc'

RSpec.configure do |rspec|
  rspec.around(:example) do |ex|
    ex.run
  rescue SystemExit
    # Do nothing
  end
end

def capture(&blk)
  old = $stdout
  $stdout = fake = StringIO.new
  blk.call
  fake.string
ensure
  $stdout = old
end
