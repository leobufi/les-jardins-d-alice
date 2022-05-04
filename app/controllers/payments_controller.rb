class PaymentsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @order = Order.where(state: 'En attente...').find(params[:order_id])
  end
end
