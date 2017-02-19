class VoteCreator

    def create_campaign(campaign_name)
      Campaign.where(name: campaign_name).first_or_create
    end

    def create_candidate(candidate_name, campaign)
      Candidate.where(name: candidate_name, campaign_id: campaign.id).first_or_create
    end

    def create_vote(vote_time, campaign, candidate, validity)
      vote = Vote.new
      vote.time = vote_time
      vote.campaign = campaign
      vote.candidate = candidate
      vote.validity = validity

      if(vote.save)
        p "vote saved - time: #{vote_time}, campaign:#{campaign_name}, choice: #{candidate_name}"
      else
        p "error, vote not saved..."
      end
    end
    
end
