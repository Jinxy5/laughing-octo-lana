class User < ActiveRecord::Base
	before_save { self.email = email.downcase }

	before_create { self.user_name = 'User' + User.count.to_s if !self.user_name  }
	before_create { self.register_key = SecureRandom.hex }
	before_create { self.culminated = 0 } #setting to false results in strange error where it can't be saved

	VALID_EMAIL_REGEX = /[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9\-.]/

#	validates :user_name, presence: true
	validates :email, presence: true, 
					  uniqueness: { case_sensitive: false },
					  format: { with: VALID_EMAIL_REGEX } 

	validates :password, length: { minimum: 6 }
	validates :password, length: { maximum: 100 }

	has_secure_password

	def culminate
		update_attribute(:culminated, 1)
	end
end
