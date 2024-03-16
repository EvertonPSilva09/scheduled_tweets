class MainController < ApplicationController
  def index
    flash.now[:notice] = "Welcome to the main page!"
    flash.now[:alert] = "See page about us :)"
  end
end
