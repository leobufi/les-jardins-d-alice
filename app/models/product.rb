class Product < ApplicationRecord
  belongs_to :coffret, optional: true
  belongs_to :category
  belongs_to :user
  has_many :line_items, dependent: :destroy

  has_one_attached :main_photo
  has_many_attached :photos_url

  monetize :price_cents

  validates :title, presence: true
  validates :description, presence: true
  validates :price_cents, presence: true
  validates :category, presence: true

  def price_with_discount
    self.price - (self.price / (100.fdiv(self.discount)))
  end

end
