class SpecialDay < ApplicationRecord
  has_many :users, though: :couple
  validates :title, date:, presence: true
end
