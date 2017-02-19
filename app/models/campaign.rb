class Campaign < ApplicationRecord
  has_many :candidates
  has_many :votes

  validates :name, presence: true
end
