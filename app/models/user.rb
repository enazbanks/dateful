class User < ApplicationRecord
  acts_as_favoritor
  validates :first_name, presence: true
  has_one :couple
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
