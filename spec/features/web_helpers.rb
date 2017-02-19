def create_vote1
  campaign1 = Campaign.create(name: 'test_campaign1')
  candidate1 = Candidate.create(name: 'test_candidate1', campaign_id: campaign1.id)
  Vote.create(time: 1168123284, campaign_id: campaign1.id, candidate_id: candidate1.id, validity: 'during')
end

# vote 2 has different campaign and different candidate

def create_vote2
  campaign2 = Campaign.create(name: 'test_campaign2')
  candidate2 = Candidate.create(name: 'test_candidate2', campaign_id: campaign2.id)
  Vote.create(time: 1168123286, campaign_id: campaign2.id, candidate_id: candidate2.id, validity: 'during')
end

# votes 3 - 6 have same campaign but different candidate from vote 1 - for testing order votes are displayed in

def create_vote3
  campaign1 = Campaign.find_by name: 'test_campaign1'
  candidate3 = Candidate.create(name: 'test_candidate3', campaign_id: campaign1.id)
  Vote.create(time: 1168123286, campaign_id: campaign1.id, candidate_id: candidate3.id, validity: 'during')
end

def create_vote4
  campaign1 = Campaign.find_by name: 'test_campaign1'
  candidate3 = Candidate.find_by name: 'test_candidate3'
  Vote.create(time: 1168123288, campaign_id: campaign1.id, candidate_id: candidate3.id, validity: 'during')
end

def create_vote5
  campaign1 = Campaign.find_by name: 'test_campaign1'
  candidate3 = Candidate.find_by name: 'test_candidate3'
  Vote.create(time: 1168123287, campaign_id: campaign1.id, candidate_id: candidate3.id, validity: 'during')
end

def create_vote6
  campaign1 = Campaign.find_by name: 'test_campaign1'
  candidate3 = Candidate.find_by name: 'test_candidate3'
  Vote.create(time: 1168123286, campaign_id: campaign1.id, candidate_id: candidate3.id, validity: 'during')
end


def create_invalid_vote_pre
  campaign1 = Campaign.find_by name: 'test_campaign1'
  candidate1 = Candidate.find_by name: 'test_candidate1'
  Vote.create(time: 1168123286, campaign_id: campaign1.id, candidate_id: candidate1.id, validity: 'pre')
end

def create_invalid_vote_post
  campaign1 = Campaign.find_by name: 'test_campaign1'
  candidate1 = Candidate.find_by name: 'test_candidate1'
  Vote.create(time: 1168123286, campaign_id: campaign1.id, candidate_id: candidate1.id, validity: 'post')
end
