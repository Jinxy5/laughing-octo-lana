class Follower < ActiveRecord::Base

	belongs_to :user
	belongs_to :discussion


	state_machine initial: :allowed do
		
		event :disallow_notifications do
			transition allowed: :disallowed
		end

		event :allow_notifications do
			transition disallowed: :allowed
		end

	end
end
