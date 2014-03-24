module SessionsHelper

	def current_user=(user)
		@current_user = user

		logger.fatal '000---'
		logger.fatal @current_user
	end

	def current_user
		remember_token = User.hash(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
	end

	def sign_in(user)
		remember_token = User.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.hash(remember_token))
		self.current_user = user
	end

	def signed_in?
		!current_user.nil?
	end

end
