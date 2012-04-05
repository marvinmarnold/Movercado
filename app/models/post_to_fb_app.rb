class PostToFbApp < App
  def process(message_object)
    message_object.
    @graph ||= Koala::Facebook::API.new(User.admin.token)
    @graph.put_object("arstarstarstars", "feed", :message => message_object.get_actual_message)
    respond_to_message(message_object, (I18n.t 'post_to_fb_app.thank_you'), '')
  end
  
  def process_as_answer(question_message, answer_message)
    false
  end
end
