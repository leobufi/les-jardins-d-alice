class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!, :current_cart, :initializer

  def initializer
    @rayons = Rayon.all
    @coffrets = Coffret.all
    @products = Product.all
    @formations = Formation.all
    @jardins = Jardin.all
    @articles = Article.all
  end

  private

  def current_cart

    if session[:cart_id]
      cart = Cart.find_by(id: session[:cart_id])
      if cart.present?
        @current_cart = cart
      else
        session[:cart_id] = nil
      end
    end

    if session[:cart_id] == nil
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
    end
  end
end
