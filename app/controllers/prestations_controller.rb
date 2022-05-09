class PrestationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @prestations = Prestation.all
  end

  def new
    @prestation = Prestation.new
  end

  def create
    @prestation = Prestation.new(prestation_params)
    @prestation.user = current_user
    if current_user.admin?
      @prestation.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @prestation = Prestation.find(params[:id])
  end

  def update
    @prestation = Prestation.find(params[:id])
    if current_user.admin?
      @prestation.update(prestation_params)
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    @prestation = Prestation.find(params[:id])
    @prestation.destroy
    redirect_to dashboard_path
  end

  private

  def prestation_params
    params.require(:prestation).permit(:title, :description, :dates, :prestation_category_id, :main_photo, photos_url: [])
  end

end
