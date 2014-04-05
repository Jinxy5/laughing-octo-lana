class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :discussion

	#has_many :replies, class_name: 'Post', foreign_key: 'replied_post_id' 

	has_and_belongs_to_many :cats, class_name: 'Post'

#	has_and_belongs_to_many :sub_posts,
#							class_name: 'Post',
#							join_table: :posts_sub_replies,
#							foreign_key: :reply_id,
#							association_foreign_key: :sub_reply_id

		def display_body

			if self.deleted
				self.body = 'This comment was deleted by an administrator on the ' + self.delete_date.to_s
			else
				self.body
			end

		end



#	belongs_to :forum, through: :discussion

end
