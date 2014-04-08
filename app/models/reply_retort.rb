class ReplyRetort < ActiveRecord::Base
	belongs_to :reply, class_name: 'Discourse'
	belongs_to :retort, class_name: 'Discourse', foreign_key: 'retort_id'
end
