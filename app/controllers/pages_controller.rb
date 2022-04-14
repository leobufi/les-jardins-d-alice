class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :dashboard ]

  def home
  end

  def dashboard
    @articles = Article.all
    @rayons = Rayon.all
    @rayon = Rayon.new
    @categories = Category.all
    @category = Category.new
    @products = Product.all
  end
end
