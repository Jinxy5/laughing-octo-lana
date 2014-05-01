class Reply < ActiveRecord::Base
	belongs_to :user
	belongs_to :discussion

	validates :description, presence: true

#	SoftDelete

end
