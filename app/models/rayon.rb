class Rayon < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :products, through: :categories
  belongs_to :user

  validates :title, presence: true

  def to_param
    "#{id}-#{title.parameterize}"
  end

end
