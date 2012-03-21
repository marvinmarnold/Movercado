class DataCollectorApp < App
  
  def process(message_object)
    user_app_var = message_object.sender.user_app_vars.find_by_app_id(self.id)
    if user_app_var && user_app_var.role == 'approved'
      input = message_object.message.split(' ')
      counter = 0
      while counter < input.length
        key = input[counter]
        value = input[counter+1]
        
        #TODO: right now going to assume that each value is a number but that should be customizable
		    if is_numeric?(value)
		      key_matches = false
		      #TODO: should make a loop that exits when finds matching key
		      self.app_vars.each do |app_var|
		        if key == app_var.string_field
		          
        end
		      #TODO: if key is valid character
		      #else
		      #end
		      #add new app_var with key value and user
        else
          
        end
        
        counter += 2
      end
    else
      respond_to_message(message_object, (I18n.t 'data_collector_app.wrong_role'), 'input,misuse')
    end
  
		
  end
  
  def process_as_answer(question_message, answer_message)
    false
  end
  
  def is_numeric?(value)
    true if Float(value) rescue false
  end
end
