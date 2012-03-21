class Phone < ActiveRecord::Base
  belongs_to :user, :dependent => :destroy
  has_many 	:message_phone_connections
  has_many 	:messages,
  					:through => :message_phone_connections
  has_many 	:message_to_phone_connections
  has_many 	:received_messages,
  					:through 	=> :message_to_phone_connections,
  					:source 	=> :message
  has_many 	:message_from_phone_connections
  has_many 	:sent_messages,
  					:through 	=> :message_from_phone_connections,
  					:source 	=> :message
  					
  @@sislog_number = SISLOG_NUMBER
  
  def self.sislog_number
    @@sislog_number
  end
end
