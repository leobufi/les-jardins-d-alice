class FormationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @formations = Formation.all
  end

  def new
    @formation = Formation.new
  end

  def create
    @formation = Formation.new(formation_params)
    @formation.user = current_user
    if current_user.admin?
      @formation.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @formation = Formation.find(params[:id])
  end

  def update
    @formation = Formation.find(params[:id])
    if current_user.admin?
      @formation.update(formation_params)
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    @formation = Formation.find(params[:id])
    @formation.destroy
    redirect_to dashboard_path
  end

  private

  def formation_params
    params.require(:formation).permit(:title, :description, :dates, :main_photo, :photos_url)
  end

end
