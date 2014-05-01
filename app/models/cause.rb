class Cause < ActiveRecord::Base
	scope :recent, order('causes.created_at ASC').limit(8)
end
