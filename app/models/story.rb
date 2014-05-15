class Story < ActiveRecord::Base
	belongs_to :user

	has_one :photo, class_name: 'Image', foreign_key: :story_id

	validates :title, presence: true
	validates :description, presence: true		





#	scope :recent, order('events.created_at ASC').limit(8)


	scope :recent, -> { order('stories.approve_date ASC').limit(5) }

	scope :approved, -> { where( state: 'approved') }#{ state: 'approved' } 
	scope :disapproved, -> { where( state: 'disapproved') }

	state_machine initial: :disapproved do
		after_transition on: :approve, do: :set_approve_date
		after_transition on: :disapprove, do: :clear_approve_date

		event :approve do
			transition disapproved: :approved
		end		

		event :disapprove do
			transition approved: :disapproved
		end
	end

	private
		def clear_approve_date
			self.update_attributes(approve_date: nil)
		end

		def set_approve_date
			self.update_attributes(approve_date: DateTime.now)
		end
end
