class SpecialDay < ApplicationRecord
  validates :title, :date, presence: true
  belongs_to :couple
  has_many :users, through: couple
end
