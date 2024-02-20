class AboutMesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @about_me = AboutMe.new
  end

  def create
    @about_me = AboutMe.new(about_me_params)
    @about_me.user = current_user
    if current_user.admin? && @about_me.save
      redirect_to dashboard_general_path
    else
      render :new
    end
  end

  def edit
    @about_me = AboutMe.find(params[:id])
  end

  def update
    @about_me = AboutMe.find(params[:id])
    if current_user.admin? && @about_me.update(about_me_params)
      redirect_to dashboard_general_path
    else
      render :new
    end
  end

  def destroy
    @about_me = AboutMe.find(params[:id])
    @about_me.destroy
    redirect_to dashboard_general_path
  end

  private

  def about_me_params
    params.require(:about_me).permit(:description, :selling_points, :main_photo)
  end
end
