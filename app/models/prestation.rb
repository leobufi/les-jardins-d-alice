class Prestation < ApplicationRecord
  belongs_to :user
  belongs_to :prestation_category

  validates :title, presence: true
  validates :description, presence: true
  validates :dates, presence: true
  has_rich_text :description

  has_one_attached :main_photo
  has_many_attached :photos_url

end
