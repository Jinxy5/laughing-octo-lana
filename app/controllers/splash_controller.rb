class SplashController < ApplicationController
	def index
		@stories = Story.recent
		@causes = Cause.recent
		@events = Event.recent
	end

	def about
	end

	def news
		@stories = Story.all.paginate(page: params[:page], per_page: 10, order: 'created_at desc' )
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
