class ApplicationController < ActionController::Base
  protect_from_forgery

  layout 'application'

private

  def require_admin
    authenticate_user! unless current_user
    redirect_to root_path, :error => "You are not authorized." unless current_user.is_admin?
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def clear_stored_location
    session[:return_to] = nil
  end
end
