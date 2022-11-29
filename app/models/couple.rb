class Couple < ApplicationRecord
  has_many :users
  has_many :bookings
  has_many :special_days
  def partner
    return users.find(!current_user) if users.length == 2

    false
  end
end
