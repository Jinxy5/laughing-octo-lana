class Forum < ActiveRecord::Base
	has_many :discussions
	has_many :posts, through: :discussions

	
	def last_post
		self.posts.last
	end

	private

end
