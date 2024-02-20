class Dashboard::UsersController < ApplicationController

  def index
    @users = User.all
  end

end
