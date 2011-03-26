class PagesController < HighVoltage::PagesController
  def show
    if params[:id].downcase == "admin"
      require_admin and return
    end
    super
  end
end