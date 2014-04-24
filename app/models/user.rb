class User < ActiveRecord::Base
	include SoftDelete

	has_many :posts
	has_many :discussions

	has_many :followers
	has_many :discussions, -> { uniq }, through: :followers

	has_one :avatar, class_name: 'Image', foreign_key: :user_id

	has_many :replies
	has_many :retorts

	has_many :user_roles
	has_many :roles, through: :user_roles

	before_save { self.email = email.downcase }

	before_create :create_register_token
	before_create { self.culminated = 0 } #setting to false results in strange error where it can't be saved
	before_create :create_remember_token
	before_create { self.user_roles.build(role_id: Role.find_by(role: 'potential').id ) } # user the add_role method here

	
	#soft_delete

	def soft_delete_message
		'widget' + self.first_name
	end

	def return_deleted_at
		self.soft_deleted_at
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
			  uniqueness: true,
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

	def has_role?(role)
		role_array.include?(role)
	end

	def allowed_forums
		allowed = []

		Forum.all.each do |forum|
			allowed << forum if forum.user_allowed?(self)
		end

		allowed
	end

	def most_popular_discussion




		most_popular = allowed_forums.first.discourses.first


		allowed_forums.each do |forum|



			forum.discourses.each do |discourse|


				most_popular = discourse if discourse.impression_count > most_popular.impression_count

			end

		end

		most_popular



	end

	def is_admin?
		role_array.include?('admin')
	end

	def is_coordinator?
		role_array.include?('coordinator')
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








	def is_op?
		#? :
	end


	def is_current_user?
		if current_user === self
			true
		else
			false
		end
	end

	def is_admin?
		if self.roles.pluck(:role).include?('admin')
			true 
		else 
			false
		end
	end




	def add_role(role)

#		ap 'Adding role ' + role

		self.update_attributes(accepted_at: Time.now) if self.is_only_potential?	

		self.user_roles.create(role_id: Role.find_by(role: role).id ) if !self.has_role?(role)


	end

	def remove_role(role)

#		ap 'Removing role ' + role

#		self.update_attribute(revoked_at: Time.now) if self.is_only_potential?	

		self.user_roles.find_by( role_id: Role.find_by(role: role).id ).destroy if self.has_role?(role)
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


		def culminate
			update_attribute(:culminated, 1)
		end
=end
end
