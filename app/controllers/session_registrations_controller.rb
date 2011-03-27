class SessionRegistrationsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /session_registrations
  # GET /session_registrations.xml
  def index
    @session_registrations = current_user.session_registrations.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @session_registrations }
    end
  end

  # GET /session_registrations/1
  # GET /session_registrations/1.xml
  def show
    @session_registration = current_user.session_registrations.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @session_registration }
    end
  end

  # GET /session_registrations/new
  # GET /session_registrations/new.xml
  def new
    @sessions = Session.all
    @session_registration = current_user.session_registrations.new
    @session_registration.children.build.session_child_registrations.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @session_registration }
    end
  end

  # GET /session_registrations/1/edit
  def edit
    @session_registration = current_user.session_registrations.find(params[:id])
  end

  # POST /session_registrations
  # POST /session_registrations.xml
  def create
    @sessions = Session.all
    @session_registration = current_user.session_registrations.new(params[:session_registration])

    respond_to do |format|
      if @session_registration.save
        format.html { redirect_to(@session_registration, :notice => 'Session registration was successfully created.') }
        format.xml  { render :xml => @session_registration, :status => :created, :location => @session_registration }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @session_registration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /session_registrations/1
  # PUT /session_registrations/1.xml
  def update
    @session_registration = current_user.session_registrations.find(params[:id])

    respond_to do |format|
      if @session_registration.update_attributes(params[:session_registration])
        format.html { redirect_to(@session_registration, :notice => 'Session registration was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @session_registration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /session_registrations/1
  # DELETE /session_registrations/1.xml
  def destroy
    @session_registration = current_user.session_registrations.find(params[:id])
    @session_registration.destroy

    respond_to do |format|
      format.html { redirect_to(session_registrations_url) }
      format.xml  { head :ok }
    end
  end
end
