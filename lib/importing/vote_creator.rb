class VoteCreator

    def create_campaign(campaign_name)
      Campaign.where(name: campaign_name).first_or_create
    end

    def create_candidate(candidate_name, campaign_id)
      Candidate.where(name: candidate_name, campaign_id: campaign_id).first_or_create
    end

    def create_vote(vote_time, campaign_id, candidate_id, validity)
      vote = Vote.new
      vote.time = vote_time
      vote.campaign_id = campaign_id
      vote.candidate_id = candidate_id
      vote.validity = validity
      vote.save ? true : false
    end

end
