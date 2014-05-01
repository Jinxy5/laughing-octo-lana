class ApplicationController < ActionController::Base
  include SimpleCaptcha::ControllerHelpers

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper


	class Hash
		def delete_blank
			delete_if{ |k, v| v.empty? }
		end
	end



	def no_guests
		redirect_to root_url unless current_user
	end
end
