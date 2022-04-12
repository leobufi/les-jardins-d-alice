class Formation < ApplicationRecord

  validates :title, presence: true
  validates :description, presence: true
  validates :dates, presence: true

end
