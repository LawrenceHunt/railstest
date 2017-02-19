require 'rails_helper'

RSpec.describe Campaign, type: :model do
  it 'is invalid with empty name field' do
    campaign = Campaign.new(name: '')
    expect(campaign).to have(1).errors_on(:name)
  end

  it 'builds a campaign with correct fields' do
    campaign = Campaign.new(name: 'test_campaign')
    expect(campaign).to be_a Campaign
  end
end
