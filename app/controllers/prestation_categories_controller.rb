class PrestationCategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @prestation_categories = PrestationCategory.all
  end

  def show
    @prestation_category = PrestationCategory.find(params[:id])
  end

  def create
    @prestation_category = PrestationCategory.new(prestation_category_params)
    @prestation_category.user = current_user
    if current_user.admin?
      @prestation_category.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @prestation_category = PrestationCategory.find(params[:id])
  end

  def update
    @prestation_category = PrestationCategory.find(params[:id])
    if current_user.admin?
      @prestation_category.update(prestation_category_params)
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    @prestation_category = PrestationCategory.find(params[:id])
    @prestation_category.destroy
    redirect_to dashboard_path
  end

  private

  def prestation_category_params
    params.require(:prestation_category).permit(:title, :user_id)
  end
end
