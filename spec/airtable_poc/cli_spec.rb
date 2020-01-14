require 'spec_helper'
require 'airtable_poc/cli'

describe AirtablePoc::CLI do
  subject(:cli) { described_class.new }

  describe '.default_command' do
    it 'defaults to `all`' do
      expect(described_class.default_command).to eq('all')
    end
  end

  describe '.version' do
    let(:stdout) { capture { cli.version } }

    it 'outputs the version' do
      expect(stdout.chomp).to eq("v#{AirtablePoc::VERSION}")
    end
  end

  describe '.all' do
    it 'retrieves all records from Airtable'

    context 'filter option' do
      it 'retrieves all records that pass the given filter'
    end
  end

  describe '.find' do
    it 'retrieves a single record from Airtable'
  end
end
