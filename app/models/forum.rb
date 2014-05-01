class Forum < ActiveRecord::Base
	has_many :discourses
	has_many :replies, through: :discourses


	has_many :discussions


	has_many :posts, through: :discussions

	has_many :allowed_roles
	has_many :roles, through: :allowed_roles



	def most_popular_discourse 
		self.discourses.maximum(:views)	
	end


	def allow_role(role)
		self.allowed_roles.create(role_id: Role.find_by(role: role).id )
	end

	def disallow_role(role)
		self.allowed_roles.destroy(role_id: Role.find_by(role: role).id )
	end

	def list_roles
		self.roles.pluck(:role).to_sentence

#		self.roles.to_se
	end

	def user_allowed?(user)
	  

	  forum_roles = []
      current_user_roles = []

      self.roles.each do |role|
        forum_roles << role.role
      end

	  user.roles.each do |role|
        current_user_roles << role.role
      end
	  
	  if !(forum_roles & current_user_roles).empty? || current_user_roles.include?('admin')
	  	true
	  else
	  	false
	  end
	end

	def show_roles
		self.roles
	end


	def last_discourse
		self.discourses.last
	end

	def last_reply
		self.replies.last
	end

	private

end
