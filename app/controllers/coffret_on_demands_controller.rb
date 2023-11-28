class CoffretOnDemandsController < ApplicationController
    skip_before_action :authenticate_user!
    
    def new
        @coffret_on_demand = CoffretOnDemand.new
    end
    
    def create
      @coffret_on_demand = CoffretOnDemand.new(coffret_on_demand_params)
      products_params = params[:coffret_on_demand][:product_ids]
      products_params.delete("")
      products = Product.find(products_params)
      @coffret_on_demand.products = products
      total_price = @coffret_on_demand.products.sum(&:price_cents)
      @coffret_on_demand.price_cents = total_price + 200
      if @coffret_on_demand.save
        redirect_to coffret_on_demand_path(@coffret_on_demand)
      else 
        redirect_to root_path, notice: "Le Coffret n'a pas pu être crée, réessayez ultérieurement"
      end
    end

    def show
        @coffret_on_demand = CoffretOnDemand.find(params[:id])
    end
  
    def edit
      @coffret_on_demand = CoffretOnDemand.find(params[:id])
    end
  
    def update
      @coffret_on_demand = CoffretOnDemand.new(coffret_on_demand_params)
      products_params = params[:coffret_on_demand][:product_ids]
      products_params.delete("")
      products = Product.find(products_params)
      @coffret_on_demand.products = products
      total_price = @coffret_on_demand.products.sum(&:price_cents)
      @coffret_on_demand.price_cents = total_price + 200
      if @coffret_on_demand.save
        redirect_to coffret_on_demand_path(@coffret_on_demand)
      else 
        redirect_to root_path, notice: "Le Coffret n'a pas pu être crée, réessayez ultérieurement"
      end
    end
  
    def destroy
      @coffret_on_demand = CoffretOnDemand.find(params[:id])
      @coffret_on_demand.destroy
      redirect_to dashboard_path
    end
  
    private
  
    def coffret_on_demand_params
      params.require(:coffret_on_demand).permit(:price_cents, :price_currency, :products, :product_ids)
    end
end
