class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase )

		if user && user.authenticate(params[:session][:password])
			sign_in(user)
			redirect_to users_url#, current_user
		else
			flash.now[:error] = 'Wrong email or password!'
			#redirect_to sign_in_path
			render 'new'
		end
		#render 'new'
	end

	def destroy
		sign_out

		flash.now[:error] = 'Signed out successfully!'
		redirect_to root_url
	end
end
