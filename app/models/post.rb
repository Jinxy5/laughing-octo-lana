class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :discussion
	has_many :replies, class_name: 'Post', foreign_key: 'replied_post_id' 


		def display_body

			if self.deleted
				self.body = 'This comment was deleted by an administrator on the ' + self.delete_date.to_s
			else
				self.body
			end

		end



#	belongs_to :forum, through: :discussion

end
