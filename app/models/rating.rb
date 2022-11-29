class Rating < ApplicationRecord
  belongs_to :booking

  validates :stars, presence: true
end
