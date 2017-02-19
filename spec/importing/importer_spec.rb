require 'rails_helper'

describe VoteImporter do

  let(:parser) { double(:voteparser) }
  let(:creator) { double(:creator) }
  subject(:importer) { described_class.new }
  importer.parser = parser
  importer.creator = creator


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
      expect(:creator).to receive(:create_campaign).with(1).argument
      importer.seed_database_from(["1168123059", "test_campaign", "during", "test_candidate"])
    end
    it 'successfully creates a candidate' do
      expect(:creator).to receive(:create_candidate).with(2).arguments
      importer.seed_database_from(["1168123059", "test_campaign", "during", "test_candidate"])
    end
    it 'successfully creates a vote' do
      expect(:creator).to receive(:create_vote).with(3).arguments
      importer.seed_database_from(["1168123059", "test_campaign", "during", "test_candidate"])
    end
  end

end
