class Product < ApplicationRecord
  belongs_to :coffret
  belongs_to :category
end
