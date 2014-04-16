module SoftDelete
	extend ActiveSupport::Concern

	module ClassMethods
		
	end




	def soft_delete(args={})
		o = {
			attributes: []
		}.merge!(args)


		if soft_deleted?
			o[:attributes].each do |key, value|
				define_method key do
					value 
				end	
			end
		end
	end


	def soft_delete!
		self.update_attributes(soft_deleted_at: DateTime.current)
	end

	def soft_undelete!
		self.update_attributes(soft_deleted_at: nil)
	end

	def soft_deleted?
		self.soft_deleted_at.present?
	end

	def self.included(base)
		base.class_eval do 
			scope :soft_deleted, -> { where('soft_deleted_at IS NOT NULL') }			
			scope :not_soft_deleted, -> { where('soft_deleted_at IS NULL') }
		end
	end

	def hard_delete!
		self.delete
	end
end
