class EventRegistrationsController < ApplicationController
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

  # GET /event_registrations/1/edit
  def edit
    @event_registration = EventRegistration.find(params[:id])
  end

  # POST /event_registrations
  # POST /event_registrations.xml
  def create
    success = true
    if current_user
      @user = current_user
    else
      password = params[:email] ? User.generate_password(params[:email]) : ''
      @user = User.new params[:user].merge(:password => password, :password_confirmation => password) 
      success = @user.save
    end

    puts params.inspect
    @event_registration = EventRegistration.new(:event_id => params[:event_id], :user => @user)
    success &= @event_registration.save

    clear_stored_location

    respond_to do |format|
      if success
        format.html { redirect_to(@event_registration, :notice => 'Event registration was successfully created.') }
        format.xml  { render :xml => @event_registration, :status => :created, :location => @event_registration }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event_registration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /event_registrations/1
  # PUT /event_registrations/1.xml
  def update
    @event_registration = EventRegistration.find(params[:id])

    respond_to do |format|
      if @event_registration.update_attributes(params[:event_registration])
        format.html { redirect_to(@event_registration, :notice => 'Event registration was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event_registration.errors, :status => :unprocessable_entity }
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