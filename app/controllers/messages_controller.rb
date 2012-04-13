require 'csv'
class MessagesController < ApplicationController
  
   def export
    @messages = Message.order("time desc")
    outfile = "movercado_messages_" + Time.now.strftime("%m-%d-%Y") + ".csv"
    
    csv_data = CSV.generate do |csv|
      csv << [
      "Time",
      "App Code",
      "To Number",
      "From Number",
      "Raw Message"
      ]
      @messages.each do |message|
        csv << [
        message.time,
        (message.app)? message.app.app_code : "NONE",
        message.sender_phone.number,
        message.recipient_phone.number,
        message.raw_message
        ]
      end
  	end
  send_data csv_data,
    :type => 'text/csv; charset=iso-8859-1; header=present',
    :disposition => "attachment;filename=#{outfile}"

  flash[:notice] = "Export complete!"
	end
  
  #this is the method that gets called when a message is received through 
  def kannel_start_point
    sender_number = params[:sender]
    recipient_number = params[:receiver]
    time_sent = params[:time]
    time_sent ||= Time.now
    message = params[:message]
    
    #find or create phones
    sender_phone = Phone.find_by_number(sender_number)
    sender_phone ||= Phone.create!(:number => sender_number)
    
    recipient_phone = Phone.find_by_number(recipient_number)
    recipient_phone ||= Phone.create!(:number => recipient_number)
    
    unless sender_phone.user
      u = User.create!
      sender_phone.update_attributes(:user => u)
    end
    
    unless recipient_phone.user
      u = User.create!
      recipient_phone.update_attributes(:user => u)
    end
    
    message_object = Message.create!(:time => time_sent, :raw_message => message)
    
    MessageToPhoneConnection.create(:message_id => message_object.id, :phone_id => recipient_phone.id)
    MessageFromPhoneConnection.create(:message_id => message_object.id, :phone_id => sender_phone.id)
    
    message_object.process
 
  end
  
  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.order("time desc").page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new
    #@message.build_message_to_phone_connection.build_phone

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(params[:message])

    respond_to do |format|
      if @message.save
        recipient_phone = Phone.find_by_number(@message.number)
  	    recipient_phone ||= User.create!.phones.create!(:number => @message.number)
        @message.send_SMS(@message.raw_message, recipient_phone, "", @message.app.id)
        format.html { redirect_to messages_path, notice: 'Message was successfully sent.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end
end
