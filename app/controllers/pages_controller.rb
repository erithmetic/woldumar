class PagesController < HighVoltage::PagesController
  layout 'application'

  def show
    if params[:id] == 'home'
      render :template => current_page, :layout => 'home'
    else
      super
    end
  end
end
