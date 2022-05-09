class PrestationCategory < ApplicationRecord
  has_many :prestations, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
end
