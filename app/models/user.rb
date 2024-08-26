class User < ApplicationRecord
  has_many :goats, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :email, presence: true
end
