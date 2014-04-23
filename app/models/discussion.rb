class Discussion < ActiveRecord::Base
	belongs_to :user
	belongs_to :forum

	has_many :replies

	def last_reply
		self.replies.last
	end

	validates :name, presence: true
	validates :description, presence: true
end
