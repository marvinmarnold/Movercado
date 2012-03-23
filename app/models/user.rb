class User < ActiveRecord::Base
  has_many :phones, :dependent => :destroy
  has_many :user_app_vars, :dependent => :destroy
  has_many :messages,
            :through => :phones
  has_many 	:sent_messages,
						:through => :phones
	has_many 	:received_messages,
						:through => :phones
						
  has_many :actor_codes
  
  accepts_nested_attributes_for :phones, :reject_if => lambda { |p| p[:number].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :user_app_vars, :reject_if => lambda { |v| v[:role].blank? }
  
  def self.genders
    %w[male female]
  end
  
  def self.marital_statuses
    %w[single married divorced widdowed]
  end
end
