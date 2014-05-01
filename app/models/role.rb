class Role < ActiveRecord::Base
	has_many :users, through: :user_roles

#	has_many :allowed_roles
	has_many :forums, through: :allowed_roles
end