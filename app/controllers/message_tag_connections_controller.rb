class MessageTagConnectionsController < ApplicationController
  # GET /message_tag_connections
  # GET /message_tag_connections.json
  def index
    @message_tag_connections = MessageTagConnection.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @message_tag_connections }
    end
  end

  # GET /message_tag_connections/1
  # GET /message_tag_connections/1.json
  def show
    @message_tag_connection = MessageTagConnection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message_tag_connection }
    end
  end

  # GET /message_tag_connections/new
  # GET /message_tag_connections/new.json
  def new
    @message_tag_connection = MessageTagConnection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message_tag_connection }
    end
  end

  # GET /message_tag_connections/1/edit
  def edit
    @message_tag_connection = MessageTagConnection.find(params[:id])
  end

  # POST /message_tag_connections
  # POST /message_tag_connections.json
  def create
    @message_tag_connection = MessageTagConnection.new(params[:message_tag_connection])

    respond_to do |format|
      if @message_tag_connection.save
        format.html { redirect_to @message_tag_connection, notice: 'Message tag connection was successfully created.' }
        format.json { render json: @message_tag_connection, status: :created, location: @message_tag_connection }
      else
        format.html { render action: "new" }
        format.json { render json: @message_tag_connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /message_tag_connections/1
  # PUT /message_tag_connections/1.json
  def update
    @message_tag_connection = MessageTagConnection.find(params[:id])

    respond_to do |format|
      if @message_tag_connection.update_attributes(params[:message_tag_connection])
        format.html { redirect_to @message_tag_connection, notice: 'Message tag connection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message_tag_connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /message_tag_connections/1
  # DELETE /message_tag_connections/1.json
  def destroy
    @message_tag_connection = MessageTagConnection.find(params[:id])
    @message_tag_connection.destroy

    respond_to do |format|
      format.html { redirect_to message_tag_connections_url }
      format.json { head :no_content }
    end
  end
end
