class Date < ApplicationRecord
  validates :title, :description, :address, :cost, :time, presence: true
end
