class VoteCreator

    def create_campaign(campaign_name)
      Campaign.where(name: campaign_name).first_or_create
    end

    def create_candidate(candidate_name, campaign)
      Candidate.where(name: candidate_name, campaign_id: campaign.id).first_or_create
    end

    def create_vote(vote_time, campaign_id, candidate_id, validity)
      vote = Vote.new
      vote.time = vote_time
      vote.campaign_id = campaign_id
      vote.candidate_id = candidate_id
      vote.validity = validity

      if(vote.save)
        p "vote saved - time: #{vote_time}, campaign:#{vote.campaign.name}, choice: #{vote.candidate.name}"
      else
        p "error, vote not saved..."
      end
    end

end
