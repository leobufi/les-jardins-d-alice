class Category < ApplicationRecord
  belongs_to :rayon
  has_many :products

  validates :title, presence: true
  validates :description, presence: true

end
