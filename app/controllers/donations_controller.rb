class DonationsController < ApplicationController
  before_filter :require_admin, :except => [:new, :create]

  # GET /donations
  # GET /donations.xml
  def index
    @donations = Donation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @donations }
    end
  end

  # GET /donations/1
  # GET /donations/1.xml
  def show
    @donation = Donation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @donation }
    end
  end

  # GET /donations/new
  # GET /donations/new.xml
  def new
    @donation = Donation.new

    if current_user
      @user = current_user
    else
      @user = User.new
      store_location
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @donation }
    end
  end

  # GET /donations/1/edit
  def edit
    @donation = Donation.find(params[:id])
  end

  # POST /donations
  # POST /donations.xml
  def create
    success = true
    if current_user
      @user = current_user
    else
      password = params[:user][:email] ? User.generate_password(params[:user][:email])[0..19] : ''
      @user = User.new params[:user].merge(:password => password, :password_confirmation => password) 
      success = @user.save
    end

    @donation = Donation.new(params[:donation].merge(
      :user => @user, :credit_card => params[:credit_card]))
    success &= @donation.save

    clear_stored_location

    respond_to do |format|
      if success
        format.html { redirect_to(page_path('get_involved'), :notice => 'Thank you for your donation') }
        format.xml  { render :xml => @donation, :status => :created, :location => @donation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @donation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /donations/1
  # PUT /donations/1.xml
  def update
    @donation = Donation.find(params[:id])

    respond_to do |format|
      if @donation.update_attributes(params[:donation])
        format.html { redirect_to(@donation, :notice => 'Donation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @donation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /donations/1
  # DELETE /donations/1.xml
  def destroy
    @donation = Donation.find(params[:id])
    @donation.destroy

    respond_to do |format|
      format.html { redirect_to(donations_url) }
      format.xml  { head :ok }
    end
  end
end
