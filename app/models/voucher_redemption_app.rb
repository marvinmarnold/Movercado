class VoucherRedemptionApp < App
  def process(message_object)
    begin
      actor_code = message_object.get_actor_code_object
    rescue
      respond_to_message(message_object, (I18n.t 	'ipc_client_registration.invalid_code'), "error")
      return false
    end
    
    #TODO: Times used should be application specific
    if actor_code.times_used > 0
      tags = "misuse, error"
      #message_object.add_tags(tags)
      respond_to_message(message_object, (I18n.t 'ipc_client_registration.already_used'), tags)
     return false
    end
    client_object = actor_code.user
    client_id = client_object.id
    vendor_id = message_object.sender_phone.user.id
  	if client_id == vendor_id
      tags = "misuse, error"
      #message_object.add_tags(tags)
      respond_to_message(message_object, (I18n.t 'default_app.action_on_self', :act => "redeem a voucher for"), tags)
      return false
     end
		if client_id
      respond_to_message(message_object, (I18n.t 	'ipc_client_registration_w_voucher.thank_you_vendor'), 
																														"successful, question, unanswered")
		  user_app_var = message_object.sender_phone.user.user_app_vars.find_or_create_by_app_id(self.id)
		  sales = user_app_var.validated_times_interacted
		  sales ||= 0
		  sales += 1
		  user_app_var.update_attributes(:validated_times_interacted => sales)
		  
		  client_object = User.find(client_id)
		  new_code = client_object.actor_codes.create!(:app => self)
		  
		  send_message_to_phone(client_object.phones.first,  
																			(I18n.t 'ipc_client_registration_w_voucher.thank_you_client'),
																			 "successful")
			actor_code.update_attributes(:times_used => actor_code.times_used + 1)
			app_var = AppVar.find_or_create_by_app_id(self.id)
			count = app_var.count
			count ||= 0
			count += 1
			app_var.update_attributes(:count => count)
			send_message_to_number("+258825077787", "#{self.name} just processed the #{count} voucher. It was #{message_object.sender_phone.number}s #{sales} sale", "")
		#send_message_to_phone(client_object.phones.first,  
		#																	(I18n.t 'ipc_client_registration_w_voucher.thank_you_client2', :code => "#{self.app_code}#{new_code.code}".upcase),
																			# "successful")
		end
	end
end
