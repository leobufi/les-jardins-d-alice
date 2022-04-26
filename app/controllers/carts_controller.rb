class CartsController < ApplicationController

  def show
    @cart = @current_cart
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end

  private
  def cart_params
    params.require(:cart).permit(:line_item_ids)
  end
end
