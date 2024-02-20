class ImagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.user = current_user
    if current_user.admin? && @image.save
      redirect_to dashboard_general_path
    else
      render :new
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if current_user.admin?
      @image.update(image_params)
    else
      render :new
    end
    redirect_to dashboard_general_path
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to dashboard_general_path
  end

  private

  def image_params
    params.require(:image).permit(:user_id, :home_cover, :jardin_cover, :coffret_on_demand_img, logos_img: [], prestation_galeries: [])
  end

end
