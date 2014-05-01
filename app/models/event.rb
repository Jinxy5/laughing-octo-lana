class Event < ActiveRecord::Base
	scope :recent, order('events.created_at ASC').limit(8)
end
