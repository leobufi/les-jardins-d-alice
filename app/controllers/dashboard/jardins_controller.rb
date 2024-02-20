class Dashboard::JardinsController < ApplicationController

  def index
    @jardins = Jardin.all
    @jardin = Jardin.new
  end

end
