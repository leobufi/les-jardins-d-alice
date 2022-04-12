class Coffret < ApplicationRecord
  has_many :products

  validates :name, presence: true
  validates :description, presence: true
  validates :price_cents, presence: true
end
