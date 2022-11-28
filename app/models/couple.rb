class Couple < ApplicationRecord
  has_many :users
  has_many :bookings
  has_many :special_days
end
