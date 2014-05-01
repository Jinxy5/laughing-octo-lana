def login_user(user, args={})
	o = {
		create: true
	}.merge!(args)

	if o[:create]
		signup_generic(user)
	else
		click_button 'Members Log In'
		fill_in 'session_email', with: user.email
		fill_in 'session_password', with: user.password
		click_button 'Sign In'
	end
end

def login_admin
end

def login_generic(user)

	
end

def signup_generic(user)
	visit root_path
	click_button 'Join Today'

	fill_in 'user_first_name', with: user.first_name
	fill_in 'user_last_name', with: user.last_name		
	fill_in 'user_user_name', with: user.user_name
	fill_in 'user_email', with: user.email
	fill_in 'user_password', with: user.password
	fill_in 'user_password_confirmation', with: user.password_confirmation
	fill_in 'user_nearest_town', with: user.nearest_town

	click_button 'Create my Account'
end
