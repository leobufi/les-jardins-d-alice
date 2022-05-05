class Jardin < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  has_rich_text :description

  has_one_attached :main_photo
  has_many_attached :photos_url

end
