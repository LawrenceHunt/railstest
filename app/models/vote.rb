class Vote < ApplicationRecord
  belongs_to :campaign
  belongs_to :candidate

  validates :time, :campaign_id, :candidate_id, :validity, presence: true
  validates :time, numericality: { only_integer: true }

end
