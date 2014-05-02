class Reply < ActiveRecord::Base
	belongs_to :user
	belongs_to :discussion

	after_create :iterate_forum_reply_count

	def iterate_forum_reply_count
		self.discussion.forum.update_attributes(reply_count: self.discussion.forum.reply_count + 1 )
	end


	validates :description, presence: true

#	SoftDelete

end
