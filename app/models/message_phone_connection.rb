class MessagePhoneConnection < ActiveRecord::Base
  belongs_to :message
  belongs_to :phone
end
