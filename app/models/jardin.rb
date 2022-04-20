class Jardin < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  # validates :main_photo, uniqueness: true
end
