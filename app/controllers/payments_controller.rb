class PaymentsController < ApplicationController
  def new
    @order = Order.where(state: 'En attente...').find(params[:order_id])
  end
end
