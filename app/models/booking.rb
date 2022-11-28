class Booking < ApplicationRecord
  validates :when, :status, presence: true
  belongs_to :date
  belongs_to :couple
  has_one :rating
  enum :status, { pending: 0, confirmed: 1, rejected: 2, free: 3 }
end
