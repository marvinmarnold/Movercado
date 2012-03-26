class McDataController < ApplicationController
  # GET /mc_data
  # GET /mc_data.json
  def index
    @mc_data = McDatum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mc_data }
    end
  end

  # GET /mc_data/1
  # GET /mc_data/1.json
  def show
    @mc_datum = McDatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mc_datum }
    end
  end

  # GET /mc_data/new
  # GET /mc_data/new.json
  def new
    @mc_datum = McDatum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mc_datum }
    end
  end

  # GET /mc_data/1/edit
  def edit
    @mc_datum = McDatum.find(params[:id])
  end

  # POST /mc_data
  # POST /mc_data.json
  def create
    @mc_datum = McDatum.new(params[:mc_datum])

    respond_to do |format|
      if @mc_datum.save
        format.html { redirect_to @mc_datum, notice: 'Mc datum was successfully created.' }
        format.json { render json: @mc_datum, status: :created, location: @mc_datum }
      else
        format.html { render action: "new" }
        format.json { render json: @mc_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mc_data/1
  # PUT /mc_data/1.json
  def update
    @mc_datum = McDatum.find(params[:id])

    respond_to do |format|
      if @mc_datum.update_attributes(params[:mc_datum])
        format.html { redirect_to @mc_datum, notice: 'Mc datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mc_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mc_data/1
  # DELETE /mc_data/1.json
  def destroy
    @mc_datum = McDatum.find(params[:id])
    @mc_datum.destroy

    respond_to do |format|
      format.html { redirect_to mc_data_url }
      format.json { head :no_content }
    end
  end
end
