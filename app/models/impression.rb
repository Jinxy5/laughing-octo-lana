class Impression < ActiveRecord::Base

	belongs_to :discourse
	belongs_to :discussion
end
