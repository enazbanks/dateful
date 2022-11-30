class Experience < ApplicationRecord
  acts_as_favoritable
  acts_as_taggable_on :tags
  acts_as_taggable_on :mood, :location #You can also configure multiple tag types per model
  has_many :bookings, dependent: :destroy
  has_many :ratings, through: :bookings
  has_many :couples, through: :bookings

  has_many_attached :photos

  validates :title, :description, :address, :cost, :time, presence: true

  def average_rating
    number = ratings.length
    if number.positive?
      total = 0
      ratings.each do |rating|
        total += rating.stars
      end
      return total unless total.positive?

      return total / number
    end
    false
  end
end
