class PostToFbApp < App
  def process(message_object)
    @graph ||= Koala::Facebook::API.new(User.admin.token)
    accounts = @graph.get_connections('me', 'accounts')
    accounts.each do |account|
      if account["name"] == "SouMaisJeitosa"
        page_graph = Koala::Facebook::GraphAPI.new(account["access_token"])
        page_graph.put_object(account["id"], "feed", :message => message_object.get_actual_message)
      end
    end
    respond_to_message(message_object, (I18n.t 'post_to_fb_app.thank_you'), '')
  end
  
  def process_as_answer(question_message, answer_message)
    false
  end
end
