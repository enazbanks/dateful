class Date < ApplicationRecord
  acts_as_favoritable
  acts_as_taggable_on :tags
  acts_as_taggable_on :mood, :location #You can also configure multiple tag types per model
  has_many :ratings, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :couples, through: :bookings

  has_many_attached :photos

  validates :title, :description, :address, :cost, :time, presence: true
end
