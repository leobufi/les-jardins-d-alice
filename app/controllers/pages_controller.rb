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
    @images = Image.all
    @image = Image.new
    @users = User.all
    if params[:query].present?
      @orders = Order.global_search(params[:query])
    else
      @orders = Order.all.reverse
    end
    respond_to do |format|
      format.html
      format.text { render partial: 'list.html', locals: { orders: @orders } }
    end
  end

  def contact
    @contact = Contact.new
  end
end
