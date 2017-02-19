require 'rails_helper'

describe Importer do

  subject(:importer) { described_class.new }

  # describe '#read_file_and_add_votes' do
  #   # subject.read_file_and_add_votes(votes_test.txt)
  #   # expect(subject).to receive(:add_vote)
  # end

  describe '#add_vote' do
    it 'prints a rejection of an invalid line' do
      line = "DEFAULT 1168123059 Campaign:ssss_uk_zzactions CONN:MIG01TU MSISDN:00777778559999 GUID:50E9B098-4F3E-4433-AC0B-AC55A7290117 Shortcode:63334"
      expect(importer.add_vote(line)).to eq "Invalid line: #{line}"
    end
  end

  describe '#check_valid' do
    it 'returns false for an invalid REGEX match' do
      line = "DEFAULT 1168123059 Campaign:ssss_uk_zzactions CONN:MIG01TU MSISDN:00777778559999 GUID:50E9B098-4F3E-4433-AC0B-AC55A7290117 Shortcode:63334"
      expect(check_valid(line)).to eq(false)
    end
    it ''
  end

  describe '#match_regex?' do
    it 'takes string with invalid byte sequence and returns it with incorrect byte removed' do
      string = "VOTE 1168042390 Campaign:\255ssss_uk_01B Validity:during Choice:Jane CONN:MIG00VU MSISDN:00777778389999 GUID:0A6829A8-A296-4E04-B50C-6C3CDF275F7E Shortcode:63334\255"
      expect(subject.check_valid(line)).to be_falsy
    end
  end

  describe '#check_utf8' do
    it 'takes string with invalid byte sequence and returns it with incorrect byte removed' do
      string = "VOTE 1168042390 Campaign:\255ssss_uk_01B Validity:during Choice:Jane CONN:MIG00VU MSISDN:00777778389999 GUID:0A6829A8-A296-4E04-B50C-6C3CDF275F7E Shortcode:63334\255"
      expect(subject.check_utf8(string)).to eq("VOTE 1168042390 Campaign:ssss_uk_01B Validity:during Choice:Jane CONN:MIG00VU MSISDN:00777778389999 GUID:0A6829A8-A296-4E04-B50C-6C3CDF275F7E Shortcode:63334")
    end
  end

  describe '#parse_vote' do
    it 'filters a valid line and returns an array of relevant values' do
      line = "VOTE 1168042390 Campaign:ssss_uk_01B Validity:during Choice:Jane CONN:MIG00VU MSISDN:00777778389999 GUID:0A6829A8-A296-4E04-B50C-6C3CDF275F7E Shortcode:63334"
      expect(importer.parse_vote(line)).to eq(["1168042390", "ssss_uk_01B", "during", "Jane"])
    end
  end

  describe '#create_campaign' do
    it 'can create a campaign given the correct params' do

    end
  end

  describe '#create_candidate' do
    it 'can create a candidate given the correct params' do
      expect {create_candidate('test_candidate1', )}
    end
  end

  describe '#create_vote' do
    it 'can create a vote given the correct params' do

    end
  end
end


# votes

# DEFAULT 1168123059 Campaign:ssss_uk_zzactions CONN:MIG01TU MSISDN:00777778559999 GUID:50E9B098-4F3E-4433-AC0B-AC55A7290117 Shortcode:63334
