class User < ApplicationRecord
  acts_as_favoritor
  validates :first_name, presence: true
  belongs_to :couple, optional: true
  has_one_attached :avatar
  before_create :add_to_couple
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
    friend = User.find_by(email: partner_email)
    if friend && friend.couple.users < 2
      couple = friend.couple
      self.couple = couple
    else
      self.couple = Couple.new
    end
  end

  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
