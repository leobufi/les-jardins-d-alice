class Dashboard::CategoriesController < ApplicationController

  def index
    @category = Category.new
    @categories = Category.all
    @rayons = Rayon.all
    @rayon = Rayon.new
  end
end
