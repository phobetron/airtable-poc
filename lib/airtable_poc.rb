module AirtablePoc
  def self.api_key
    ENV['AIRTABLE_API_KEY']
  end
end

require 'airtable_poc/cli'
