require 'rails_helper'

describe VoteCreator do

  subject(:vote_creator) { described_class.new }

  describe '#create_campaign' do
    it 'can create a campaign given the correct params' do
      expect {create_campaign('test_campaign')}.to change { Campaign.count }.by(1)
    end
  end

  describe '#create_candidate' do
    it 'can create a candidate given the correct params' do
      expect {create_candidate('test_candidate1', 30)}.to change { Candidate.count }.by(1)
    end
  end

  describe '#create_vote' do
    it 'can create a vote given the correct params' do
      expect {create_vote(1168041805, 30, 20, "during")}.to change { Candidate.count }.by(1)
    end
  end


end
