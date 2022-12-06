class Experience < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  acts_as_favoritable
  acts_as_taggable_on :tags
  acts_as_taggable_on :mood, :location, :secret #You can also configure multiple tag types per model
  has_many :bookings, dependent: :destroy
  has_many :ratings, through: :bookings
  has_many :couples, through: :bookings

  has_many_attached :photos

  validates :title, :description, :address, :cost, :time, presence: true

  def average_rating_float
    number = ratings.length
    if number.positive?
      total = 0.0
      ratings.each do |rating|
        total += rating.stars
      end
      return total unless total.positive?

      return (total / number).round(1)
    end
    false
  end
  def average_rating
    number = ratings.length
    if number.positive?
      total = 0.0
      ratings.each do |rating|
        total += rating.stars
      end
      return total.round unless total.positive?

      return (total / number).round
    end
    false
  end

  def booked_days
    # array = []
    # self.Bookings.each do |booking|
        # array << booking.when
        #end
    # return array
  end
end
