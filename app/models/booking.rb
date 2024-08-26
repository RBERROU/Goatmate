class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :goat

  validates :status, :total_price, presence: true
end
