class Product < ApplicationRecord
  belongs_to :coffret, optional: true
  belongs_to :category
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :price_cents, presence: true
  validates :category, presence: true
  # validates :main_photo, uniqueness: true
end
