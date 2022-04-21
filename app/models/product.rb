class Product < ApplicationRecord
  belongs_to :coffret, optional: true
  belongs_to :category
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :price_cents, presence: true
  validates :category, presence: true
  # validates :main_photo, uniqueness: true

  def price_with_discount
    self.price_cents - (self.price_cents / (100 / self.discount))
  end

end
