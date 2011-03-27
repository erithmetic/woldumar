class CampsController < ApplicationController
  before_filter :require_admin, :except => ['all', 'one']
 
  # GET /camps
  def all
    @camps = Camp.all
  end

  # GET /camps/1
  def one
    begin
      @camp = Camp.find params[:id]
    rescue ActiveRecord::RecordNotFound
      redirect_to all_camps_url
    end
  end

  # GET /admin/camps
  def index
    @camps = Camp.all
  end

  # GET /admin/camps/1
  def show
    begin
      @camp = Camp.find params[:id]
    rescue ActiveRecord::RecordNotFound
      redirect_to camps_url
    end
  end

  # GET /admin/camps/new
  def new
    @camp = Camp.new
  end

  # GET /admin/camps/1/edit
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

    @camp.start_time = Chronic.parse(params[:camp][:start_time]) if params[:camp][:start_time]
    @camp.end_time = Chronic.parse(params[:camp][:end_time]) if params[:camp][:end_time]


    if @camp.save
      redirect_to @camp, :notice => 'Camp was successfully created.'
    else
      render :action => "new"
    end
  end

  # PUT /admin/camps/1
  def update
    begin
      @camp = Camp.find params[:id]
    rescue ActiveRecord::RecordNotFound
      redirect_to camps_url
    end

    params[:camp][:start_time] = Chronic.parse(params[:camp][:start_time]) if params[:camp][:start_time]
    params[:camp][:end_time] = Chronic.parse(params[:camp][:end_time]) if params[:camp][:end_time]

    if @camp.update_attributes params[:camp]
      redirect_to @camp, :notice => 'Camp was successfully updated.'
    else
      render :action => "edit"
    end
  end

  # DELETE /admin/camps/1
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
