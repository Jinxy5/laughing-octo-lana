class SplashController < ApplicationController
	def index
		@causes = Cause.recent
		@events = Event.recent
	end

	def about
	end

	def news
	end

	def events
	end

	def sponsors
	end

	def splash
	end

	def links
	end



end
