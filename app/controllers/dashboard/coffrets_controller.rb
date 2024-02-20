class Dashboard::CoffretsController < ApplicationController

  def index
    @coffret_on_demands = CoffretOnDemand.all
    @coffrets = Coffret.all
    @coffret = Coffret.new
  end
end
