class UserAppVarsController < ApplicationController
  # GET /user_app_vars
  # GET /user_app_vars.json
  def index
    @user_app_vars = UserAppVar.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_app_vars }
    end
  end

  # GET /user_app_vars/1
  # GET /user_app_vars/1.json
  def show
    @user_app_var = UserAppVar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_app_var }
    end
  end

  # GET /user_app_vars/new
  # GET /user_app_vars/new.json
  def new
    @user_app_var = UserAppVar.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_app_var }
    end
  end

  # GET /user_app_vars/1/edit
  def edit
    @user_app_var = UserAppVar.find(params[:id])
  end

  # POST /user_app_vars
  # POST /user_app_vars.json
  def create
    @user_app_var = UserAppVar.new(params[:user_app_var])

    respond_to do |format|
      if @user_app_var.save
        format.html { redirect_to @user_app_var, notice: 'User app var was successfully created.' }
        format.json { render json: @user_app_var, status: :created, location: @user_app_var }
      else
        format.html { render action: "new" }
        format.json { render json: @user_app_var.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_app_vars/1
  # PUT /user_app_vars/1.json
  def update
    @user_app_var = UserAppVar.find(params[:id])

    respond_to do |format|
      if @user_app_var.update_attributes(params[:user_app_var])
        format.html { redirect_to @user_app_var, notice: 'User app var was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_app_var.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_app_vars/1
  # DELETE /user_app_vars/1.json
  def destroy
    @user_app_var = UserAppVar.find(params[:id])
    @user_app_var.destroy

    respond_to do |format|
      format.html { redirect_to user_app_vars_url }
      format.json { head :no_content }
    end
  end
end
