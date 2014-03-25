class Discussion < ActiveRecord::Base
	before_create { self.view = 0 }

	belongs_to :user
	belongs_to :forum
	has_many :posts

	has_many :impressions
#	has_many :views

	def last_post
		self.posts.last
	end
	
	def impression_count
		self.impressions.count
	end

	def unique_impression_count
	end

	def iterate_impression(ip)
		self.impressions.create(ip_address: ip, user_id: '')

	#	self.impressions.create(ip_address: request.remote_ip, user_id: current_user)
	end
end
