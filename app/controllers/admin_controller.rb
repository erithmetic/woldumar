class AdminController < ApplicationController
  before_filter :require_admin
  
  def index
  end
  
  def users
    if params[:search]
      @users = User.search(params[:search], params[:page])
    else
      @users = User.paginate :page => params[:page], :order => 'last_name, first_name DESC'
    end
  end
  
  def edit_user
    @user = User.find(params[:id])
  end
  
  def update_user
    @user = User.find(params[:id])

    unless params[:user][:password].present?
      params[:user][:password_confirmation] = nil
      params[:user][:password_confirmation] = nil
    end

    if @user.update_attributes(params[:user])
      redirect_to url_for(:action => :users), :notice => 'User was successfully updated'
    else
      render :action => :edit_user
    end
  end
end
