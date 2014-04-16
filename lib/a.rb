require 'active_support/concern'
require 'active_record'

module HasDefault
  extend ActiveSupport::Concern

  module ClassMethods
    def has_default
      attr_accessible :is_default

      before_create  :set_default_if_none_exists, unless: :is_default?
      before_save    :set_default,                if: :is_default?
      before_destroy :set_fallback_default,       if: :is_default?
    end
  end

  def set_default
    current_default = self.class.first conditions: { user_id: self.user_id, is_default: true }
    current_default.update_column(:is_default, false) if current_default
    self.update_column(:is_default, true) unless self.new_record?
  end

  def set_fallback_default
    if self.is_default?
      fallback = self.class.first conditions: { user_id: self.user_id, is_default: false }
      fallback.update_column(:is_default, true) if fallback
    end
  end

  def set_default_if_none_exists
    current_default = self.class.first conditions: { user_id: self.user_id, is_default: true }
    self.is_default = true unless current_default
  end
end

class ActiveRecord::Base
  include HasDefault
end

=begin
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

	def hard_delete!
		self.delete
	end

	def soft_deleted?
		ap self
		self.soft_deleted_at.present?
	end

	def self.included(base)
		base.class_eval do 
			scope :soft_deleted, -> { where('soft_deleted_at IS NOT NULL') }			
			scope :not_soft_deleted, -> { where('soft_deleted_at IS NULL') }
		end
	end

end


class ActiveRecord::Base
	include HasDefault
end
=end
#ActiveRecord::Base.send(:include, SoftDelete)
