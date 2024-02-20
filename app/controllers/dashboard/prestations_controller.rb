class Dashboard::PrestationsController < ApplicationController

  def index
    @prestations = Prestation.all
    @prestation = Prestation.new
    @prestation_categories = PrestationCategory.all
    @prestation_category = PrestationCategory.new
  end

end
