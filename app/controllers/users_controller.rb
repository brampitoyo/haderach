class UsersController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  
  def new
    if current_user.id == 1
      @user = User.new
    end
  end
  
  def create
    if current_user.id == 1
      @user = User.new(params[:user])
    end
    if @user.save
      flash[:notice] = "Thank you for signing up! You are now logged in."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
end
