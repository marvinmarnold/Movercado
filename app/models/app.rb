class App < ActiveRecord::Base
  has_many :app_vars
  has_many :messages
  
  accepts_nested_attributes_for :app_vars, :reject_if => lambda { |v| v[:name].blank? }
  
  def process(message)
		respond_to_message(message, (I18n.t 'default_app.process'), "default")
  end
  
  def respond_to_message(message_received, text_to_send, tags)
  	Message.new.send_SMS(text_to_send, message_received.sender_phone, tags, self.id)
  end
  
  def send_message_to_number(number, text_to_send, tags)
  	recipient_phone = Phone.find_by_number(number)
  	recipient_phone ||= User.create!.phones.create!(:number => number)
  	send_message_to_phone(recipient_phone, text_to_send, tags)
  end
  
  def send_message_to_phone(recipient_phone, text_to_send, tags)
  	Message.new.send_SMS(text_to_send, recipient_phone, tags, self.id)
  end

end
