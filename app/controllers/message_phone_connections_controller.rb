class MessagePhoneConnectionsController < ApplicationController
  # GET /message_phone_connections
  # GET /message_phone_connections.json
  def index
    @message_phone_connections = MessagePhoneConnection.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @message_phone_connections }
    end
  end

  # GET /message_phone_connections/1
  # GET /message_phone_connections/1.json
  def show
    @message_phone_connection = MessagePhoneConnection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message_phone_connection }
    end
  end

  # GET /message_phone_connections/new
  # GET /message_phone_connections/new.json
  def new
    @message_phone_connection = MessagePhoneConnection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message_phone_connection }
    end
  end

  # GET /message_phone_connections/1/edit
  def edit
    @message_phone_connection = MessagePhoneConnection.find(params[:id])
  end

  # POST /message_phone_connections
  # POST /message_phone_connections.json
  def create
    @message_phone_connection = MessagePhoneConnection.new(params[:message_phone_connection])

    respond_to do |format|
      if @message_phone_connection.save
        format.html { redirect_to @message_phone_connection, notice: 'Message phone connection was successfully created.' }
        format.json { render json: @message_phone_connection, status: :created, location: @message_phone_connection }
      else
        format.html { render action: "new" }
        format.json { render json: @message_phone_connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /message_phone_connections/1
  # PUT /message_phone_connections/1.json
  def update
    @message_phone_connection = MessagePhoneConnection.find(params[:id])

    respond_to do |format|
      if @message_phone_connection.update_attributes(params[:message_phone_connection])
        format.html { redirect_to @message_phone_connection, notice: 'Message phone connection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message_phone_connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /message_phone_connections/1
  # DELETE /message_phone_connections/1.json
  def destroy
    @message_phone_connection = MessagePhoneConnection.find(params[:id])
    @message_phone_connection.destroy

    respond_to do |format|
      format.html { redirect_to message_phone_connections_url }
      format.json { head :no_content }
    end
  end
end
