class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :goat

  validates :status, presence: true, inclusion: { in: %w[pending approved rejected], message: "%{value} is not a valid status" }
  validates :total_price, presence: true
  validates :rent_start, presence: true
  validates :rent_end, presence: true

  before_save :calculate_total_price

  def calculate_total_price
    days = (rent_end - rent_start).to_i
    self.total_price = goat.price_per_day * days
  end
end
