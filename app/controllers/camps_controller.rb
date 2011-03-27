class CampsController < ApplicationController
  before_filter :require_admin, :except => [:index, :show]
  
  # GET /camps
  def index
    @camps = Camp.all
  end

  # GET /camps/1
  def show
    begin
      @camp = Camp.find params[:id]
    rescue ActiveRecord::RecordNotFound
      redirect_to camps_url
    end
  end

  # GET /camps/new
  def new
    @camp = Camp.new
  end

  # GET /camps/1/edit
  def edit
    begin
      @camp = Camp.find params[:id]
    rescue ActiveRecord::RecordNotFound
      redirect_to camps_url
    end
  end

  # POST /camps
  def create
    @camp = Camp.new params[:camp]

    if @camp.save
      redirect_to @camp, :notice => 'Camp was successfully created.'
    else
      render :action => "new"
    end
  end

  # PUT /camps/1
  def update
    begin
      @camp = Camp.find params[:id]
    rescue ActiveRecord::RecordNotFound
      redirect_to camps_url
    end
    
    if @camp.update_attributes params[:camp]
      redirect_to @camp, :notice => 'Camp was successfully updated.'
    else
      render :action => "edit"
    end
  end

  # DELETE /camps/1
  def destroy
    begin
      @camp = Camp.find params[:id]
    rescue ActiveRecord::RecordNotFound
    end
    if @camp
      @camp.destroy
    end

    redirect_to camps_url
  end
end
