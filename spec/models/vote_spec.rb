require 'rails_helper'

RSpec.describe Vote, type: :model do
  it 'empty time field shows 2 errors - presence and integer' do
    vote = Vote.new(time: nil, campaign_id: 30, candidate_id: 30, validity: 'during')
    expect(vote).not_to be_valid
    expect(vote).to have(2).errors_on(:time)
  end

  it 'string time field shows 1 error - presence' do
    vote = Vote.new(time: 'invalid', campaign_id: 30, candidate_id: 30, validity: 'during')
    expect(vote).not_to be_valid
    expect(vote).to have(1).errors_on(:time)
  end

  it 'is not valid with empty validity field' do
    vote = Vote.new(time: 1168041915, campaign_id: 30, candidate_id: 30, validity: '')
    expect(vote).not_to be_valid
  end
end
