class CampsController < ApplicationController
  # GET /camps
  # GET /camps.xml
  def index
    @camps = Camp.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @camps }
    end
  end

  # GET /camps/1
  # GET /camps/1.xml
  def show
    @camp = Camp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @camp }
    end
  end

  # GET /camps/new
  # GET /camps/new.xml
  def new
    @camp = Camp.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @camp }
    end
  end

  # GET /camps/1/edit
  def edit
    @camp = Camp.find(params[:id])
  end

  # POST /camps
  # POST /camps.xml
  def create
    @camp = Camp.new(params[:camp])

    respond_to do |format|
      if @camp.save
        format.html { redirect_to(@camp, :notice => 'Camp was successfully created.') }
        format.xml  { render :xml => @camp, :status => :created, :location => @camp }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @camp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /camps/1
  # PUT /camps/1.xml
  def update
    @camp = Camp.find(params[:id])

    respond_to do |format|
      if @camp.update_attributes(params[:camp])
        format.html { redirect_to(@camp, :notice => 'Camp was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @camp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /camps/1
  # DELETE /camps/1.xml
  def destroy
    @camp = Camp.find(params[:id])
    @camp.destroy

    respond_to do |format|
      format.html { redirect_to(camps_url) }
      format.xml  { head :ok }
    end
  end
end
