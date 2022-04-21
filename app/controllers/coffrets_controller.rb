class CoffretsController < ApplicationController

  def index
    @coffrets = Coffret.all
  end

  def show
    @coffret = Coffret.find(params[:id])
  end

  def new
    @coffret = Coffret.new
  end

  def create
    @coffret = Coffret.new(coffret_params)
    @coffret.user = current_user
    coffret_products_params = params[:coffret][:product_ids]
    coffret_products_params.delete("")
    coffret_products = Product.find(coffret_products_params)
    @coffret.coffret_products = coffret_products
    if current_user.admin?
      @coffret.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @coffret = Coffret.find(params[:id])
  end

  def update
    @coffret = Coffret.find(params[:id])
    coffret_products_params = params[:coffret][:product_ids]
    coffret_products_params.delete("")
    coffret_products = Product.find(coffret_products_params)
    @coffret.coffret_products = coffret_products
    if current_user.admin?
      @coffret.update(coffret_params)
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    @coffret = Coffret.find(params[:id])
    @coffret.destroy
    redirect_to dashboard_path
  end

  private

  def coffret_params
    params.require(:coffret).permit(:title, :description, :price_cents, :price_currency, :coffret_products, :product_ids)
  end

end
