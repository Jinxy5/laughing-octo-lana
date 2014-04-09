module UsersHelper
	def name_or_email(user)
	
	end

	def	contextual_user(user)
		if user === current_user
			'Your'		
		else
			user.user_name + '\'s'
		end
	end

end
