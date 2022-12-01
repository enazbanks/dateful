class SpecialDay < ApplicationRecord
  validates :name, :date, presence: true
  belongs_to :couple
  has_many :users, through: :couple
end
