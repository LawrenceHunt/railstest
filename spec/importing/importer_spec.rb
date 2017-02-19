require 'rails_helper'

describe VoteImporter do

  subject(:importer) { described_class.new }

  describe '#read_file_and_add_votes' do
    it 'reads from the test file with 5 entries and calls #check_valid_and_process 5 times' do
      expect(subject).to receive(:check_valid_and_process).exactly(5).times
      subject.read_file_and_add_votes('votes_test.txt')
    end
  end

  describe '#check_valid_and_process' do
    it 'prints a rejection of an invalid line' do
      line = "DEFAULT 1168123059 Campaign:ssss_uk_zzactions CONN:MIG01TU MSISDN:00777778559999 GUID:50E9B098-4F3E-4433-AC0B-AC55A7290117 Shortcode:63334"
      expect(subject.check_valid_and_process(line)).to eq "Invalid line: #{line}"
    end
  end

end
