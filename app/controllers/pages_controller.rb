class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @articles = Article.all
    @rayons = Rayon.all
    @rayon = Rayon.new
    @categories = Category.all
    @category = Category.new
    @products = Product.all
    @prestations = Prestation.all
    @prestation = Prestation.new
    @prestation_categories = PrestationCategory.all
    @prestation_category = PrestationCategory.new
    @jardins = Jardin.all
    @jardin = Jardin.new
    @coffrets = Coffret.all
    @coffret = Coffret.new
    @users = User.all
    @orders = Order.all
  end
end
