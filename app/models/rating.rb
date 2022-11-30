class Rating < ApplicationRecord
  belongs_to :booking

  validates :stars, presence: true
  validates :stars, inclusion: { in: [1, 2, 3, 4, 5], allow_nill: false }
end
