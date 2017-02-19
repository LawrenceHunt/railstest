class CampaignsController < ApplicationController

  def index
    @campaigns = Campaign.all.sort_by(&:name)
  end

  def campaign
    @campaign = Campaign.find(params[:id])
    @candidates = @campaign.candidates.all.sort_by {|candidate| candidate.votes.count }.reverse
  end

end
