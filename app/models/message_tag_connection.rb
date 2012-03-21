class MessageTagConnection < ActiveRecord::Base
  belongs_to :message
  belongs_to :tag
end
