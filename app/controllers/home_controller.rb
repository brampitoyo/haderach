class HomeController < ApplicationController
  def index
    #render :home
  end

  def show
    page = params[:page] ? params[:page] : "index" 
    @index = true if page == "index"
    render :action => page
  end
end
