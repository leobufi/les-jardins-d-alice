class PrestationCategory < ApplicationRecord
  has_many :prestations, dependent: :destroy
  belongs_to :user

  has_one_attached :main_photo

  validates :title, presence: true
end
