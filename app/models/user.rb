require "open-uri"
class User < ApplicationRecord
  acts_as_favoritor
  validates :first_name, presence: true
  belongs_to :couple, optional: true
  has_one_attached :avatar
  after_create :add_to_couple
  before_save :avatar_check
  attr_accessor :partner_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def partner
    if self.couple
      return couple.users.where.not(id: self.id).first
    end

    false
  end

  def add_to_couple
    unless self.couple
      friend = User.find_by(email: partner_email)
      if friend && friend.couple.users.length < 2
        couple = friend.couple
        self.couple = couple
        self.save!
      else
        self.couple = Couple.new
        self.save!
      end
    end
  end

  def avatar_check
    unless avatar.key
      file = URI.open("https://i.pravatar.cc/40")
      avatar.attach(io: file, filename: "avatar.jpg", content_type: "image/jpg")
    end
  end

  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
