class Discussion < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :forum

	has_many :replies

	has_many :followers
	has_many :users, -> { uniq }, through: :followers 

	after_save { add_follower(self.user) }
	


#	def supress_notifications 
#	end

#	def allow_notifications
#	end
	
	def notify_all_users(reply, discussion, forum)
		self.users.each do |user|
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
		Follower.find_or_create_by(user_id: user.id, discussion_id: self.id )
	end


	validates :name, presence: true
	validates :description, presence: true
end
