class VoucherRequestApp < App
  def process(message_object)
    new_app_code = (message_object.get_app_code == "222")? "111" : "333"
    respond_to_message(message_object, (I18n.t 	'voucher_request_app.code', :code => "#{new_app_code}#{message_object.sender_phone.user.actor_codes.create(:app => self).code}".upcase), "")
	end
end
