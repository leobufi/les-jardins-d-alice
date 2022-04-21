class Coffret < ApplicationRecord
  has_many :products
  belongs_to :user

  serialize :coffret_products, Array

  validates :title, presence: true
  validates :description, presence: true
  validates :price_cents, presence: true
end
