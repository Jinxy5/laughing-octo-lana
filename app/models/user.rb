class User < ActiveRecord::Base
	has_many :posts
	has_many :discussions

	has_many :user_roles
	has_many :roles, through: :user_roles

	before_save { self.email = email.downcase }

	before_create { self.user_name = 'User' + User.count.to_s if !self.user_name  }
	before_create :create_register_token
	before_create { self.culminated = 0 } #setting to false results in strange error where it can't be saved
	before_create :create_remember_token
	before_create { self.user_roles.build(role_id: Role.find_by(role: 'potential').id ) }

	VALID_EMAIL_REGEX = /[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9\-.]/

#	validates :user_name, presence: true
	validates :email, presence: true, 
					  uniqueness: { case_sensitive: false },
					  format: { with: VALID_EMAIL_REGEX } 

	validates :password, length: { minimum: 6 }
	validates :password, length: { maximum: 100 }

	has_secure_password

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.hash(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private 

		def create_register_token
			self.register_key = User.hash(User.new_remember_token)
			self.register_token_created_at = Time.now
		end

		def create_remember_token
			self.register_key = User.hash(User.new_remember_token)
	#		update_attribute(:remember_token, 'hiya boyz')
		end

=begin
		Do this in future. Make the register key more secure with a hash
		def create_register_key

		end
=end

		def culminate
			update_attribute(:culminated, 1)
		end
end
