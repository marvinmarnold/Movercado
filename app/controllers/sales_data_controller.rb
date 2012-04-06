class SalesDataController < ApplicationController
  # GET /sales_data
  # GET /sales_data.json
  def index
    @sales_data = SalesDatum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sales_data }
    end
  end

  # GET /sales_data/1
  # GET /sales_data/1.json
  def show
    @sales_datum = SalesDatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sales_datum }
    end
  end

  # GET /sales_data/new
  # GET /sales_data/new.json
  def new
    @sales_datum = SalesDatum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sales_datum }
    end
  end

  # GET /sales_data/1/edit
  def edit
    @sales_datum = SalesDatum.find(params[:id])
  end

  # POST /sales_data
  # POST /sales_data.json
  def create
    @sales_datum = SalesDatum.new(params[:sales_datum])

    respond_to do |format|
      if @sales_datum.save
        format.html { redirect_to @sales_datum, notice: 'Sales datum was successfully created.' }
        format.json { render json: @sales_datum, status: :created, location: @sales_datum }
      else
        format.html { render action: "new" }
        format.json { render json: @sales_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sales_data/1
  # PUT /sales_data/1.json
  def update
    @sales_datum = SalesDatum.find(params[:id])

    respond_to do |format|
      if @sales_datum.update_attributes(params[:sales_datum])
        format.html { redirect_to @sales_datum, notice: 'Sales datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sales_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_data/1
  # DELETE /sales_data/1.json
  def destroy
    @sales_datum = SalesDatum.find(params[:id])
    @sales_datum.destroy

    respond_to do |format|
      format.html { redirect_to sales_data_url }
      format.json { head :no_content }
    end
  end
  

end
