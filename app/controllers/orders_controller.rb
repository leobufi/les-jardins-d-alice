class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.state = 'En attente...'
    @order.amount = @current_cart.sub_total
    @current_cart.line_items.each do |item|
      @order.line_items << item
      item.cart_id = nil
    end

    @order.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: 'Votre commande',
        amount: @order.amount_cents,
        currency: 'eur',
        quantity: 1
        }],
        success_url: order_url(@order),
        cancel_url: order_url(@order)
      )

    @order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :email, :address, :state, :amount_cents, :checkout_session_id, :line_item_ids)
  end

end
