class Discourse < ActiveRecord::Base
	belongs_to :forum
	belongs_to :user

	has_many :discourse_replies
	has_many :replies, through: :discourse_replies 

	has_many :reply_retorts
	has_many :retorts, through: :reply_retorts
end
