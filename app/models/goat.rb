class Goat < ApplicationRecord
  belongs_to :user
  has_one :booking, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true, uniqueness: true
end
