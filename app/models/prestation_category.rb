class PrestationCategory < ApplicationRecord
  has_many :prestations, dependent: :destroy
  belongs_to :user

  has_one_attached :main_photo
  has_many_attached :photos

  validates :title, presence: true
end
