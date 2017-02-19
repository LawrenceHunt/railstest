class Candidate < ApplicationRecord
  belongs_to :campaign
  has_many :votes

  validates :name, :campaign_id, presence: true
end
