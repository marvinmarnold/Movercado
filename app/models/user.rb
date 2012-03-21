class User < ActiveRecord::Base
  has_many :phones
  has_many :messages,
            :through => :phones
  has_many 	:sent_messages,
						:through => :phones
	has_many 	:received_messages,
						:through => :phones
  
  accepts_nested_attributes_for :phones
end
