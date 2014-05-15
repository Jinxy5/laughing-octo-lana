class ImagesController < ApplicationController
 before_action :set_user, only: [:create]
 before_action :redirect_if_empty, except: [:show]

  def show

    send_file "private/#{params[:file_name]}.#{params[:extension]}"

    rescue ActionController::MissingFile
    #  send_file "public"
  end

  def create
    ap "------------------------------------------------------"
    ap image_params
    #   Parameters: {"file_name"=>"RtQbxQc0uft7-liMXvV4rw", "extension"=>"gif"}
    ap "------------------------------------------------------"

  	@user.create_avatar(file_name: image_params[:file_name])
  	
  	redirect_to @user, success: 'Profile image created!'
  end

  def create_story_image
    @story = Story.find(params[:story_id])
    @story.create_image(file_name: image_params[:file_name])

    redirect_to root_url, success: 'story done!'
  end


  private

  def redirect_if_empty
    redirect_to @user, success: 'No image uploaded' unless params[:user]
  end

  def set_user
  	@user = User.find(params[:user_id])
  end

  def image_params
  	params.require(:user).permit(:file_name) 
  end
end
