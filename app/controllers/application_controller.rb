class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def require_admin
    authenticate_user! unless current_user
    redirect_to root_path, :error => "You are not authorized." unless current_user.is_admin?
  end

end
