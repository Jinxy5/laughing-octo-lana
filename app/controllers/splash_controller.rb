class SplashController < ApplicationController
	def index
		@causes = Cause.recent
		@events = Event.recent
	end

	def donate
	end

	def events
	end

# events:
	def event_1
	end

#news:
	def news_1
	end

	def new_site
		
	end

	def new
	end
end
