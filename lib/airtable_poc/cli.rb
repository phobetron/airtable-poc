require 'thor'
require 'airrecord'

module AirtablePoc
  class CLI < Thor
    default_command :all

    class_option :base, type: :string, default: 'app1SdgjgIFrMNWGq'
    class_option :table, type: :string, default: 'JATO B2B'

    desc 'all', 'lists all records in a given Base and Table'
    option :filter, type: :string, default: nil
    def all
      table = Airrecord.table(AirtablePoc.api_key, options[:base], options[:table])
      table.all(paginate: false, filter: options[:filter]).each do |record|
        puts "\n#{record.id}:"
        pp record.fields
      end
    end

    desc 'find', 'finds a specific record in a given Base and Table'
    def find(record_id)
      table = Airrecord.table(AirtablePoc.api_key, options[:base], options[:table])
      record = table.find(record_id)
      pp record.fields
    end

    desc 'update', 'updates a field\'s value for a specific record in a given Base and Table'
    def update(record_id, field, value)
      table = Airrecord.table(AirtablePoc.api_key, options[:base], options[:table])
      record = table.find(record_id)
      record[field] = value
      pp record.save(typecast: true)
    end

    desc 'delete', 'deletes a specific record in a given Base and Table'
    def delete(record_id)
      table = Airrecord.table(AirtablePoc.api_key, options[:base], options[:table])
      record = table.find(record_id)
      pp record.destroy
    end

    desc 'version', ' airtable-poc version'
    def version
      require_relative 'version'
      puts "v#{VERSION}"
    end
    map %w[--version -v] => :version
  end
end
