class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :discussion
#	belongs_to :forum, through: :discussion

	#   has_many :replies, foreign_key: "to_id", class_name: "Micropost"

	has_many :replies, class_name: 'Post', foreign_key: 'replied_post_id' 
end
