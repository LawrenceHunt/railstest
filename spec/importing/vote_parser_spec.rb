require 'rails_helper'

describe VoteParser do

subject(:parser) { described_class.new }

  describe '#check_valid' do
    it 'returns false for an invalid REGEX match' do
      line = "DEFAULT 1168123059 Campaign:ssss_uk_zzactions CONN:MIG01TU MSISDN:00777778559999 GUID:50E9B098-4F3E-4433-AC0B-AC55A7290117 Shortcode:63334"
      expect(parser.check_valid(line)).to eq(false)
    end
    it 'takes string with invalid byte sequence and returns it with incorrect byte removed' do
      line = "VOTE 1168042390 Campaign:\255ssss_uk_01B Validity:during Choice:Jane CONN:MIG00VU MSISDN:00777778389999 GUID:0A6829A8-A296-4E04-B50C-6C3CDF275F7E Shortcode:63334\255"
      expect(parser.check_valid(line)).to eq "VOTE 1168042390 Campaign:ssss_uk_01B Validity:during Choice:Jane CONN:MIG00VU MSISDN:00777778389999 GUID:0A6829A8-A296-4E04-B50C-6C3CDF275F7E Shortcode:63334"
    end
  end

  describe '#parse_vote' do
    it 'filters a valid line and returns an array of relevant values' do
      line = "VOTE 1168042390 Campaign:ssss_uk_01B Validity:during Choice:Jane CONN:MIG00VU MSISDN:00777778389999 GUID:0A6829A8-A296-4E04-B50C-6C3CDF275F7E Shortcode:63334"
      expect(parser.parse_vote(line)).to eq(["1168042390", "ssss_uk_01B", "during", "Jane"])
    end
  end

end
