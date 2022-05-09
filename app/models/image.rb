class Image < ApplicationRecord
  belongs_to :user

  has_one_attached :home_cover
  has_one_attached :jardin_cover
  has_many_attached :prestation_galery
end
