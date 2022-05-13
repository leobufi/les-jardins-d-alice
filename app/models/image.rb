class Image < ApplicationRecord
  belongs_to :user

  has_many_attached :prestation_galery
  has_one_attached :home_cover
  has_one_attached :jardin_cover
end
