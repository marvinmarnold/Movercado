Rails.application.config.middleware.use OmniAuth::Builder do

  provider :facebook, FACEBOOK_KEY, FACEBOOK_SECRET, 
		{:scope => "read_friendlists, read_mailbox, read_stream, user_about_me, user_activities, user_birthday,
		  user_checkins, user_education_history,user_events,user_groups,user_hometown,user_interests,
		  user_likes,user_location,user_notes,user_online_presence,user_photos,user_questions,
		  user_relationships,user_relationship_details,user_religion_politics,user_status,user_videos,
		  user_website,user_work_history,email", :client_options => {:ssl => {:ca_path => "/etc/ssl/certs"}}}

end
