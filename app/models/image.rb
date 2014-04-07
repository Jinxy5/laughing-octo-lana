class Image < ActiveRecord::Base

	mount_uploader :file_name, AvatarUploader

	belongs_to :user
end
