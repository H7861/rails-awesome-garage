class Car < ApplicationRecord
  belongs_to :owner
  has_many :reviews, dependent: :destroy
  has_many :favourites, dependent: :destroy

  validates :brand, :model, :year, :fuel, presence: true
  validates :year, numericality: { only_integer: true }
end
