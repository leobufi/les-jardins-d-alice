class Category < ApplicationRecord
  belongs_to :rayon
  belongs_to :user
  has_many :products, dependent: :destroy

  has_one_attached :main_photo

  validates :title, presence: true
  validates :description, presence: true
  validates :rayon, presence: true

end
