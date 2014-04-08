class User < ActiveRecord::Base
	has_many :posts
	has_many :discussions

	has_one :avatar, class_name: 'Image', foreign_key: :user_id

	has_many :replies
	has_many :retorts
	has_many :discourses

	has_many :user_roles
	has_many :roles, through: :user_roles

	before_save { self.email = email.downcase }

	before_create :create_register_token
	before_create { self.culminated = 0 } #setting to false results in strange error where it can't be saved
	before_create :create_remember_token
	before_create { self.user_roles.build(role_id: Role.find_by(role: 'potential').id ) } # user the add_role method here
	before_create :create_fallback_image


	def create_fallback_image
		self.create_avatar.create_fallback
	end

	VALID_EMAIL_REGEX = /[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9\-.]/

	validates :first_name,
			  presence: true, 
			  if: :first_name

	validates :last_name,
			  presence: true,
			  if: :last_name

	validates :user_name,
			  presence: true,
			  if: :user_name

	validates :email, presence: true, 
					  uniqueness: { case_sensitive: false },
					  format: { with: VALID_EMAIL_REGEX }, 
					  if: :email 

	validates :password,
			  length: { minimum: 6, maximum: 10 },
			  if: :password
	
	has_secure_password



	def role_array
		self.roles.pluck(:role)
	end

	def is_admin?
		role_array.include?('admin')
	end

	def is_coordinator?
		role_array.include?('coodinator')
	end

	def is_midweek?
		role_array.include?('midweek')
	end

	def is_rider?
		role_array.include?('rider')
	end

	def is_only_potential?
		if role_array === ['potential'] 
			true
		else
			false
		end
	end


	# virtual attributes
	def admin
		is_admin?
	end

	def coordinator
		is_coordinator?
	end

	def midweek
		is_midweek?
	end

	def rider
		is_rider?
	end
	


	def make_admin!
		add_role('admin')
	end

	def make_coordinator!
		add_role('coordinator')
	end

	def make_midweek!
		add_role('midweek')
	end

	def make_rider!
		add_role('rider')
	end



	def denounce_admin!
		remove_role('admin')
	end

	def denounce_coordinator!
		remove_role('coordinator')
	end

	def denounce_midweek!
		remove_role('midweek')
	end

	def denounce_rider!
		remove_role('rider')
	end













	def is_admin?
		if self.roles.pluck(:role).include?('admin')
			true 
		else 
			false
		end
	end



	def add_role(role)
		self.user_roles.create(role_id: Role.find_by(role: role).id )
	end

	def remove_role(role)
		self.roles.delete( id: Role.find_by(role: role).id )
	end

	def list_roles
		self.roles.pluck(:role).to_sentence
	end

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
