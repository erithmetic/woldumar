class EventRegistrationsController < ApplicationController
  before_filter :require_admin, :except => [:new, :create]

  # GET /event_registrations
  # GET /event_registrations.xml
  def index
    @event_registrations = EventRegistration.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @event_registrations }
    end
  end

  # GET /event_registrations/1
  # GET /event_registrations/1.xml
  def show
    @event_registration = EventRegistration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event_registration }
    end
  end

  # GET /event_registrations/new
  # GET /event_registrations/new.xml
  def new
    @event = Event.find params[:event_id]
    @event_registration = EventRegistration.new

    if current_user
      @user = current_user
    else
      @user = User.new
      store_location
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event_registration }
    end
  end

  # POST /event_registrations
  # POST /event_registrations.xml
  def create
    success = true
    if current_user
      @user = current_user
    else
      password = params[:user][:email] ? User.generate_password(params[:user][:email])[0..19] : ''
      @user = User.new params[:user].merge(:password => password, :password_confirmation => password) 
      success = @user.save
    end

    @event = Event.find params[:event_id]
    @event_registration = EventRegistration.new(:event => @event, :user => @user)
    success &= @event_registration.save

    clear_stored_location

    respond_to do |format|
      if success
        format.html { redirect_to(@event, :notice => "You are registered for #{@event.name}.") }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # DELETE /event_registrations/1
  # DELETE /event_registrations/1.xml
  def destroy
    @event_registration = EventRegistration.find(params[:id])
    @event_registration.destroy

    respond_to do |format|
      format.html { redirect_to(event_registrations_url) }
      format.xml  { head :ok }
    end
  end
end
