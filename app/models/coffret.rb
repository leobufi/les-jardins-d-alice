class Coffret < ApplicationRecord
  has_many :products
  belongs_to :user
  has_many :line_items, dependent: :destroy

  has_one_attached :main_photo

  serialize :coffret_products, Array

  monetize :price_cents

  validates :title, presence: true
  validates :description, presence: true
  validates :price_cents, presence: true
end
