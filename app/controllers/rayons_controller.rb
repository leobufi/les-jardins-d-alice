class RayonsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @rayons = Rayon.all
  end

  def show
    @rayon = Rayon.find(params[:id])
  end

  # def new
  #   @rayon = Rayon.new
  # end

  def create
    @rayon = Rayon.new(rayon_params)
    @rayon.user = current_user
    if current_user.admin?
      @rayon.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @rayon = Rayon.find(params[:id])
  end

  def update
    @rayon = Rayon.find(params[:id])
    if current_user.admin?
      @rayon.update(rayon_params)
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    @rayon = Rayon.find(params[:id])
    @rayon.destroy
    redirect_to dashboard_path
  end

  private

  def rayon_params
    params.require(:rayon).permit(:title, :selling_points)
  end
end
