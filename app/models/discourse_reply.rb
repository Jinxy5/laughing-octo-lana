class DiscourseReply < ActiveRecord::Base
	belongs_to :discourse
	belongs_to :reply, class_name: 'Discourse', foreign_key: 'reply_id'#, polymorphic: true
end
