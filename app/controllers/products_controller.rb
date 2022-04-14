class ProductsController < ApplicationController

  def index
    @product = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if current_user.admin?
      @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if current_user.admin?
      @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to dashboard_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :origin, :photos_url, :main_photo, :price_cents, :price_currency, :coffret_id, :category_id)
  end

end
