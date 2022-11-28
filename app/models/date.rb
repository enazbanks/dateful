class Date < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :couples, through: :bookings

  has_many_attached :photos

  validates :title, :description, :address, :cost, :time, presence: true
end