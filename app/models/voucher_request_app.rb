class VoucherRequestApp < App
  def process(message_object)
    respond_to_message(message_object, (I18n.t 	'voucher_request_app.code', :code => "111#{message_object.sender_phone.user.actor_codes.create(:app => self).code}".upcase), "")
	end
end
