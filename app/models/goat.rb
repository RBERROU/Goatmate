class Goat < ApplicationRecord
  belongs_to :user
  has_one :booking, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true, uniqueness: true
  validates :price_per_day, presence: true
  validates :bio, presence: true, length: { maximum: 50 }

  # Comment out this line to remove the user presence validation
  # validates :user, presence: true
  scope :approved, -> { where(approved: true) }
  scope :pending_approval, -> { where(approved: [false, nil]) }
end
