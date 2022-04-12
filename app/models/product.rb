class Product < ApplicationRecord
  belongs_to :coffret, optional: true
  belongs_to :category

  validates :title, presence: true
  validates :description, presence: true
  validates :price_cents, presence: true
  # validates :main_photo, uniqueness: true
end
