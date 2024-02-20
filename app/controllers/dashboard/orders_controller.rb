class Dashboard::OrdersController < ApplicationController

  def index
    if params[:query].present?
      @orders = Order.global_search(params[:query])
    else
      @orders = Order.all.reverse
    end

    respond_to do |format|
      format.html
      format.text { render partial: 'list.html', locals: { orders: @orders } }
    end
  end

end
