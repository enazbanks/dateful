class User < ApplicationRecord
  acts_as_favoritor
  validates :first_name, presence: true
  belongs_to :couple, optional: true
  has_one_attached :avatar
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

  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
