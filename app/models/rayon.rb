class Rayon < ApplicationRecord
  has_many :categories
  has_many :products, through: :categories

  validates :title, presence: true
end
