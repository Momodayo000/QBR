class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :notice

  validates :score, presence: true
end
