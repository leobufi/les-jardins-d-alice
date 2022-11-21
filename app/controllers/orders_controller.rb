class OrdersController < ApplicationController
  skip_before_action :authenticate_user!

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

    if @order.Chèque?
      @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      # OrderMailer.with(order: @order).client_confirmation.deliver_now
      # OrderMailer.with(order: @order).alice_confirmation.deliver_now
      flash[:notice] = 'Votre commande a bien été prise en compte ! Merci beaucoup !'
      redirect_to root_path
    else
      @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil

      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        shipping_address_collection: {
          allowed_countries: ['FR', 'DZ', 'DE', 'AT', 'BE', 'BR', 'BG',
            'CA', 'CN', 'CY', 'DK', 'ES', 'EE', 'FI', 'GR', 'HU', 'IN',
            'IE', 'IT', 'JP', 'LV'],
        },
        # shipping_options: [
        #   {
        #     shipping_rate: "shr_1KxSU7K8Fc6uMHLbTmMGiAxe",
        #   },
        #   {
        #     shipping_rate: "shr_1KxSXPK8Fc6uMHLbmwCB76EI",
        #   },
        # ],
        line_items: [{
          name: 'Votre commande pour Les Jardins d\'Alice',
          amount: @order.amount_cents,
          currency: 'eur',
          quantity: 1
          }],
          success_url: order_url(@order),
          cancel_url: order_url(@order)
        )

      @order.update(checkout_session_id: session.id)
      # OrderMailer.with(order: @order).client_confirmation.deliver_now
      # OrderMailer.with(order: @order).alice_confirmation.deliver_now
      redirect_to new_order_payment_path(@order)
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to dashboard_path
  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :email, :address, :state, :amount_cents, :data, :check, :card, :payment_method, :checkout_session_id, :line_item_ids)
  end

end
