class Dashboard::CoffretsController < ApplicationController

  def index
    @coffret_on_demands = CoffretOnDemand.all
    @coffrets = Coffret.all
    @coffret = Coffret.new
    @filtered_products = Product.where(sku: [false, nil])
  end
end
