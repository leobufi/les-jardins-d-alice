class AboutMe < ApplicationRecord
  belongs_to :user
  has_one_attached :main_photo

  validates :description, presence: true
end
