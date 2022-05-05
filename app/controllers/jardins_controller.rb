class JardinsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @jardins = Jardin.all
  end

  def new
    @jardin = Jardin.new
  end

  def create
    @jardin = Jardin.new(jardin_params)
    @jardin.user = current_user
    if current_user.admin?
      @jardin.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @jardin = Jardin.find(params[:id])
  end

  def update
    @jardin = Jardin.find(params[:id])
    if current_user.admin?
      @jardin.update(jardin_params)
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    @jardin = Jardin.find(params[:id])
    @jardin.destroy
    redirect_to dashboard_path
  end

  private

  def jardin_params
    params.require(:jardin).permit(:title, :description, :photos_url, :main_photo, photos_url: [])
  end

end
