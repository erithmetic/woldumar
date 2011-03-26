class AdminController < ApplicationController
  before_filter :require_admin
  
  def index
  end
  
  def users
    @users = User.all
  end
  
  def edit_user
    @user = User.find(params[:id])
  end
  
  def update_user
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to url_for(:action => :users), :notice => 'User was successfully updated'
    else
      render :action => :edit_user
    end
  end
end
