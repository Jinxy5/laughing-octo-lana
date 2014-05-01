class Image < ActiveRecord::Base

	mount_uploader :file_name, AvatarUploader, auto_validate: false

#	def create_fallback
#		self.update_attributes(file_name: 'aaaaa')
#	end

	#validates_presence_of :file_name

	belongs_to :user
end
