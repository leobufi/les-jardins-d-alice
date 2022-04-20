class CoffretsController < ApplicationController

  def index
    @coffrets = Coffret.all
  end

  def show
    @coffret = Coffret.find(params[:id])
  end

  def new
    @coffret = Coffret.new
  end

  def create
    @coffret = Coffret.new(coffret_params)
    @coffret.user = current_user
    if current_user.admin?
      @coffret.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @coffret = Coffret.find(params[:id])
  end

  def update
    @coffret = Coffret.find(params[:id])
    if current_user.admin?
      @coffret.update(coffret_params)
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    @coffret = Coffret.find(params[:id])
    @coffret.destroy
    redirect_to dashboard_path
  end

  private

  def coffret_params
    params.require(:coffret).permit(:title, :description, :price_cents, :price_currency)
  end

end
