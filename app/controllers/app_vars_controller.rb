class AppVarsController < ApplicationController
  # GET /app_vars
  # GET /app_vars.json
  def index
    @app_vars = AppVar.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @app_vars }
    end
  end

  # GET /app_vars/1
  # GET /app_vars/1.json
  def show
    @app_var = AppVar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @app_var }
    end
  end

  # GET /app_vars/new
  # GET /app_vars/new.json
  def new
    @app_var = AppVar.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @app_var }
    end
  end

  # GET /app_vars/1/edit
  def edit
    @app_var = AppVar.find(params[:id])
  end

  # POST /app_vars
  # POST /app_vars.json
  def create
    @app_var = AppVar.new(params[:app_var])

    respond_to do |format|
      if @app_var.save
        format.html { redirect_to @app_var, notice: 'App var was successfully created.' }
        format.json { render json: @app_var, status: :created, location: @app_var }
      else
        format.html { render action: "new" }
        format.json { render json: @app_var.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /app_vars/1
  # PUT /app_vars/1.json
  def update
    @app_var = AppVar.find(params[:id])

    respond_to do |format|
      if @app_var.update_attributes(params[:app_var])
        format.html { redirect_to @app_var, notice: 'App var was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @app_var.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app_vars/1
  # DELETE /app_vars/1.json
  def destroy
    @app_var = AppVar.find(params[:id])
    @app_var.destroy

    respond_to do |format|
      format.html { redirect_to app_vars_url }
      format.json { head :no_content }
    end
  end
end
