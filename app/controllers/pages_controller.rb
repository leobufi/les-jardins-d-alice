class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @articles = Article.all
    @category = Category.new
    @categories = Category.all
    @coffrets = Coffret.all
    @coffret = Coffret.new
    @images = Image.all
    @image = Image.new
    @jardins = Jardin.all
    @jardin = Jardin.new
    @prestations = Prestation.all
    @prestation = Prestation.new
    @prestation_categories = PrestationCategory.all
    @prestation_category = PrestationCategory.new
    @products = Product.all.reverse
    @rayons = Rayon.all
    @rayon = Rayon.new
    @users = User.all
    @about_me = AboutMe.new
    @about_mes = AboutMe.all

    # // ORDERS \\ #

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


  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :email, :address, :state, :amount_cents, :checkout_session_id, :line_item_ids)
  end

end
