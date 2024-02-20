class Dashboard::ProductsController < ApplicationController

  def index
     @products = Product.all.reverse
  end
end
