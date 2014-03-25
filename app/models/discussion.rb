class Discussion < ActiveRecord::Base
	before_create { self.view = 0 }

	belongs_to :user
	belongs_to :forum
	has_many :posts

#	has_many :views

	def last_post
		self.posts.last
	end
	
	def iterate_view
	#	self.view = 1121212
	end
end
