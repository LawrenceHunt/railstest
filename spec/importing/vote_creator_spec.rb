require 'rails_helper'

describe VoteCreator do

  subject(:vote_creator) { described_class.new }

  describe '#create_campaign' do
    it 'can create a campaign given the correct params' do
      expect {subject.create_campaign('another_test_campaign')}.to change { Campaign.count }.by(1)
    end
  end

  describe '#create_candidate' do
    it 'can create a candidate given the correct params' do
      campaign = Campaign.create(name: "test_campaign")
      expect {subject.create_candidate('another_test_candidate', campaign.id)}.to change { Candidate.count }.by(1)
    end
  end

  describe '#create_vote' do
    it 'can create a vote given the correct params' do
      campaign = Campaign.create(name: "test_campaign")
      candidate = Candidate.create(name: "test_candidate", campaign_id: campaign.id)
      expect {subject.create_vote(1168041805, campaign.id, candidate.id, "during")}.to change { Vote.count }.by(1)
    end
  end


end
