class CategoriesController < ApplicationController

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    if current_user.admin?
      @category.save
      redirect_to dashboard_path
    else
      render :home
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if current_user.admin?
      @category.update(category_params)
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to dashboard_path
  end

  private

  def category_params
    params.require(:category).permit(:title, :description, :rayon_id)
  end
end
