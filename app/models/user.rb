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
  has_many :sales_datum
  
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  accepts_nested_attributes_for :phones, :reject_if => lambda { |p| p[:number].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :user_app_vars, :reject_if => lambda { |v| v[:role].blank? }
  
  def self.genders
    %w[male female]
  end
  
  def self.marital_statuses
    %w[single married divorced widdowed]
  end
  
  def self.admin
    p = Phone.find_by_number(Phone.sislog_number)
  	unless p
  	  p = Phone.create!(:number => Phone.sislog_number, :user => User.create!)
	  end
	  return p.user
  end
  
end
