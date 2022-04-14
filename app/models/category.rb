class Category < ApplicationRecord
  belongs_to :rayon
  belongs_to :user
  has_many :products, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :rayon, presence: true

end
