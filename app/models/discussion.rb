class Discussion < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :forum

	has_many :replies

	has_many :followers
	has_many :users, -> { uniq }, through: :followers 

	has_many :impressions

	
	validates :name, presence: true
	validates :description, presence: true

	after_create { set_counters_to_zero 
				 	add_follower(self.user) }

	def set_counters_to_zero
		self.views = 0
		self.reply_count = 0
		self.follower_count = 0
	end
	
	def iterate_reply_count
		self.update_attributes(reply_count: reply_count + 1 )

		# de iterate
	end

	def iterate_follower_count
		self.update_attributes(follower_count: reply_count + 1 )

#		self.update_attributes(follower_count: 1)
	end

#	def user_seen_me_or_owner?(user)
#		!self.impressions.exists?(ip_address: ip_address, user_id: user.id) || user.id == op.id	
#	end


	def iterate_view(ip_address, user)


		unless self.impressions.exists?(ip_address: ip_address, user_id: user.id) || user.id == op.id
				
			self.transaction do 
				self.update_attributes(views: views + 1 )
				self.impressions.create(ip_address: ip_address, user_id: user.id) 
			end

		end

	end

	def notify_all_users(reply, discussion, forum)
		self.users.each do |user|
			ap "ya ya, sending email to #{user.user_name}"
			DiscussionMailer.delay.new_reply_notification(user, reply, discussion, forum )#.deliver #unless follower.is_current_user?
		end
	end


	def last_reply
		self.replies.last
	end

	def op
		self.user
	end

	def add_follower(user)

	
		unless self.followers.exists?(user_id: user.id)

			self.transaction do
				self.update_attributes(follower_count: follower_count + 1)
				self.followers.create(user_id: user.id)
			end
			
		end


	end

	alias_method :author, :user

	def author_exists?
		author.present?
	end

	def author_name
		author_exists? ? user.user_name : super
	end

end
