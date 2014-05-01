class Story < ActiveRecord::Base
	belongs_to :user

	validates :title, presence: true
	validates :description, presence: true	

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
