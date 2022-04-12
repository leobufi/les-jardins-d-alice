class Jardin < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :main_photo, uniqueness: true
end
