class Discourse < ActiveRecord::Base
	belongs_to :forum
	belongs_to :user

	has_many :impressions

	has_many :discourse_replies
	has_many :replies, through: :discourse_replies

	has_many :reply_retorts
	has_many :retorts, through: :reply_retorts

	before_save :iterate_depth




	def last_reply
		self.replies.last
	end

#    def reply
 #       DiscourseReply.where(reply_id: id).first.try(:discourse) ||
  #      ReplyRetort.where(retort_id: id).first.try(:reply)
   # end

    alias_method :parent, :reply
    alias_method :discourse, :reply


	def iterate_depth
		
		if is_reply?
			self.depth = 1
		elsif is_retort?
			#self.depth = + 1 # is parent depth + 1
		end
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

#	private

	def is_discourse?
		!is_reply? && !is_retort?
	end

	def is_reply?
		DiscourseReply.where(reply_id: id).any?
	end

	def is_retort?
		ReplyRetort.where(retort_id: id).any?
	end
end
