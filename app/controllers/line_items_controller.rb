class LineItemsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    if params[:product_id]
      chosen_product = Product.find(params[:product_id])
    else
      chosen_product = nil
    end

    if params[:coffret_id]
      chosen_coffret = Coffret.find(params[:coffret_id])
    else
      chosen_coffret = nil
    end

    current_cart = @current_cart


    if current_cart.products.include?(chosen_product)
      @line_item = current_cart.line_items.find_by(product_id: chosen_product)
      @line_item.quantity += 1
    elsif current_cart.coffrets.include?(chosen_coffret)
      @line_item = current_cart.line_items.find_by(coffret_id: chosen_coffret)
      @line_item.quantity += 1
    else
      @line_item = LineItem.new
      @line_item.cart = current_cart
      @line_item.product = chosen_product
      @line_item.coffret = chosen_coffret
    end

    @line_item.save
    redirect_to cart_path(current_cart)
    # flash[:notice] = "Produit ajouté à votre panier."
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to cart_path(@current_cart)
  end

  def add_quantity
    @line_item = LineItem.find(params[:id])
    @line_item.quantity += 1
    @line_item.save
    redirect_to cart_path(@current_cart)
  end

  def reduce_quantity
    @line_item = LineItem.find(params[:id])
    if @line_item.quantity > 1
      @line_item.quantity -= 1
    end
    @line_item.save
    redirect_to cart_path(@current_cart)
  end

  private
    def line_item_params
      params.require(:line_item).permit(:quantity, :product_id, :cart_id, :coffret_id )
    end
end
