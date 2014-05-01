class AllowedRole < ActiveRecord::Base
	belongs_to :forum
	belongs_to :role
end
