class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :goat

  validates :status, presence: true, inclusion: { in: %w[pending approved rejected], message: "%{value} is not a valid status" }
  validates :total_price, presence: true
  validates :rent_start, presence: true
  validates :rent_end, presence: true

  scope :pending_approval, -> { where(status: 'pending') }

end
