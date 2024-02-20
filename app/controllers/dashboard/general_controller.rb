class Dashboard::GeneralController < ApplicationController

  def index
    @about_me = AboutMe.new
    @about_mes = AboutMe.all
    @images = Image.all
    @image = Image.new
  end

end
