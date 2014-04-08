class Image < ActiveRecord::Base

	mount_uploader :file_name, AvatarUploader

	def create_fallback
		self.update_attributes(file_name: 'aaaaa')
	end

	belongs_to :user
end
