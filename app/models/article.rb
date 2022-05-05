class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
  validates :date, presence: true

  has_rich_text :content
  has_one_attached :main_photo
  has_many_attached :photos_url

end
