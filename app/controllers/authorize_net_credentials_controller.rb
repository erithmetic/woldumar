class AuthorizeNetCredentialsController < ApplicationController
  before_filter :require_admin
  
  # GET /admin/authorize_net_credentials/edit
  def edit
    @credential = AuthorizeNetCredential.first
  end

  # PUT /admin/authorize_net_credentials
  def update
    if AuthorizeNetCredential.first.update_attributes(params[:authorize_net_credential])
      redirect_to url_for(:action => :edit), :notice => 'Authorize.Net credentials successfully updated.'
    else
      render :action => :edit
    end
  end
end
