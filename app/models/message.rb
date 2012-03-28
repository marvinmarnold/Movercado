class Message < ActiveRecord::Base
  belongs_to :app
  has_one :message_to_phone_connection
	has_one :recipient_phone,
					:through => :message_to_phone_connection,
					:source => :phone
	has_one :recipient,
					:through => :recipient_phone,
					:source => :user
	has_one :message_from_phone_connection
	has_one :sender_phone,
					:through => :message_from_phone_connection,
					:source => :phone
	has_one :sender,
					:through => :sender_phone,
					:source => :user
					
  @@default_app_code = DEFAULT_APP_CODE
  paginates_per 25
					
	def process
	  something_tried = false
	  begin
     	app = App.find_by_app_code(get_app_code)
    rescue Exception::RuntimeError
    end
		if app #is part of an app
       	app.process(self)
       	something_tried = true
     	else
     	  #process as question
		  end
		  unless something_tried
		    app = App.find_by_app_code(@@default_app_code)
     		app.process(self)
    	end
    	self.update_attributes(:app => app)
  end
  
  def self.default_app_code
    @@default_app_code
  end

  
  def self.replace_ambig_characters(text)
    # o => 0
    # i, l => 1
    # s => 5
    return text.gsub('o','0').gsub('i','1').gsub('l','1').gsub('s','5')
  end
  
  #should eventually return the correct psi number given the corresponding carrier
    def self.admin_phone_for_number(number)
  	admin_phone = Phone.find_by_number(Phone.sislog_number)
  	unless admin_phone
  	  admin_phone = Phone.create!(:number => Phone.sislog_number, :user => User.create!)
	  end
	  admin_phone
  end
  def send_SMS(text, recipient_phone, tags, app_id)
  	admin_phone = Message.admin_phone_for_number(recipient_phone.number)
  	begin
   		RestClient.get 'localhost:13014/cgi-bin/sendsms', {:params => {:username => 'kannel',
                                                                     :password => 'kannel',
                                                                     :to => recipient_phone.number,
                                                                     :text => text}}
    rescue
    end
   	self.update_attributes(:time => Time.now, :raw_message => text,
                           :app_id => app_id)
    MessageToPhoneConnection.create!(:phone_id => recipient_phone.id, :message_id => self.id)
    MessageFromPhoneConnection.create!(:phone_id => admin_phone.id, :message_id => self.id)
    #self.add_tags(tags)
  end
  
  def get_actor_code_object
    actor_code = ActorCode.find_by_code(get_actor_code)
    unless actor_code
      raise "invalid_actor_code_error"
    end
    return actor_code
  end
  
  #assumes sanitized message
  def decode_actor_code(actor_code)
    #Rails.logger.info("Decoding actor code: #{actor_code}")
    actor_code = Message.remove_noise_from_actor_code(actor_code)
    decoded_holder = 0
    max_users = 10000
    code_length = actor_code.length
    i = 0
    #26 letters + 10 digits - s,i,l,o
    base_for_conversion = 32 #should get from app var
    while i < code_length
      c = actor_code[i].unpack('C')[0]
      #Rails.logger.info("Character #{i}: #{c}")
      #is it a number
      if c > 47 && c < 58 
        c -= 48
      #ambig characters have been removed so there is no i, l, o, s
      elsif c >96 && c < 119
        c -= 87
      elsif c == 119
        c = 18 # w => i
      elsif c == 120
        c = 21 # x => l
      elsif c == 121
        c = 24 # y => o
      elsif c == 122
        c = 28 # z => s
      else
        raise "invalid_character_error"
      end
      decoded_holder += c * (base_for_conversion**(code_length-i-1))
      i += 1
    end
    
    if (decoded_holder % max_users) == 0 
      return max_users
    else
      return decoded_holder % max_users
    end
  end
  
  def get_actor_code
      sanitize_and_get_range(3, 9)
  end
  
  def get_app_code
      sanitize_and_get_range(0, 3)
  end
  
  def sanitize_and_get_range(first, last)
    message_text = self.raw_message
    message_text = message_text.downcase
    message_text = message_text.delete(' ')
    message_text = Message.replace_ambig_characters(message_text)
    if message_text.length >= last
      return message_text[first, last]
    else
      raise "code_out_of_range"
    end
  end
end
