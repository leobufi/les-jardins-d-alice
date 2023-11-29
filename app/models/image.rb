class Image < ApplicationRecord
  belongs_to :user

  has_many_attached :prestation_galeries
  has_many_attached :logos_img
  has_one_attached :home_cover
  has_one_attached :jardin_cover
  has_one_attached :coffret_on_demand_img
end
