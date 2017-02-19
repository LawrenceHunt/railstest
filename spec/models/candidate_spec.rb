require 'rails_helper'

RSpec.describe Candidate, type: :model do
  it 'is invalid with empty name field' do
    candidate = Candidate.new(name: '', campaign_id: 31)
    expect(candidate).not_to be_valid
    expect(candidate).to have(1).errors_on(:name)
  end

  it 'is invalid with empty campaign_id' do
    candidate = Candidate.new(name: 'test_candidate', campaign_id: '')
    expect(candidate).not_to be_valid
    expect(candidate).to have(1).errors_on(:campaign_id)
  end

  it 'builds a candidate with correct fields' do
    candidate = Candidate.new(name: 'test_candidate', campaign_id: 31)
    expect(candidate).to be_a Candidate
  end
end
