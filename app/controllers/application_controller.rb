class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!, :current_cart, :initializer

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :admin])
  end

  def initializer
    @rayons = Rayon.all
    @coffrets = Coffret.all
    @products = Product.all
    @prestations = Prestation.all
    @prestation_categories = PrestationCategory.all
    @jardins = Jardin.all
    @articles = Article.all
    @images = Image.all
    @about_mes = AboutMe.all
    @cart = @current_cart
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

  def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
  end

end
