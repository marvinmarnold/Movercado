class DataCollectorApp < App
  
  def process(message_object)
    user_app_var = message_object.sender.user_app_vars.find_by_app_id(self.id)

      input = message_object.raw_message[3,message_object.raw_message.length-3].delete(' ')
      if input.match(/\A(\w{1}\d+)+\Z/)
        well_formed = true
        input.scan(/\w{1}\d+/).each do |data|
          product = data[0]
          quantity = data[1,data.length-1]
          unless is_numeric?(quantity) && !(self.app_vars.where(:name => "product").collect{ |t| t.str_val.downcase} & ["#{product}".downcase]).empty?
            well_formed = false
          end
        end
        
      else
        respond_to_message(message_object, (I18n.t 'data_collector_app.invalid_input'), 'input,error')
        return false
      end

    
    #TODO: this should be moved up so that we don't loop twice
    if well_formed
      input.scan(/\w{1}\d+/).each do |data|
          product = data[0]
          quantity = data[1,data.length-1]
            message_object.sender.sales_datum.create!(:product => SalesDatum.products[product], :quantity => quantity) 
          end
      respond_to_message(message_object, (I18n.t 'data_collector_app.success'), 'input,error')
    else
      respond_to_message(message_object, (I18n.t 'data_collector_app.invalid_input'), 'input,error')
    end
		
  end
  
  def process_as_answer(question_message, answer_message)
    false
  end
  
  def is_numeric?(value)
    true if Float(value) rescue false
  end
  
end
