require 'rails_helper'

describe VoteImporter do

  subject(:importer) { described_class.new }
  let(:parser) { double(:voteparser) }
  let(:creator) { double(:creator) }



  # describe '#read_file_and_add_votes' do
  #   # subject.read_file_and_add_votes(votes_test.txt)
  #   # expect(subject).to receive(:add_vote)
  # end

  describe '#check_valid_and_process' do
    it 'prints a rejection of an invalid line' do
      line = "DEFAULT 1168123059 Campaign:ssss_uk_zzactions CONN:MIG01TU MSISDN:00777778559999 GUID:50E9B098-4F3E-4433-AC0B-AC55A7290117 Shortcode:63334"
      expect(importer.add_vote(line)).to eq "Invalid line: #{line}"
    end
  end

  describe '#seed_database_from' do
    it 'successfully creates a campaign' do
      expect {  }
    end
    it 'successfully creates a candidate' do

    end
    it 'successfully creates a vote' do

    end
  end


end


# votes

# DEFAULT 1168123059 Campaign:ssss_uk_zzactions CONN:MIG01TU MSISDN:00777778559999 GUID:50E9B098-4F3E-4433-AC0B-AC55A7290117 Shortcode:63334
