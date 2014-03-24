class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :discussion
#	belongs_to :forum, through: :discussion
end
