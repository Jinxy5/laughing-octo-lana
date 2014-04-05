class Discourse < ActiveRecord::Base
	belongs_to :forum
	
	has_many :discourse_replies
	
	has_many :replies, through: :discourse_replies 
end
