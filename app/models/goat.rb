class Goat < ApplicationRecord
  belongs_to :user
  has_one :booking, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
