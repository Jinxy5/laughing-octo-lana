class ImagesController < ApplicationController
 before_action :set_user, only: [:create]
 before_action :redirect_if_empty, except: [:show]

  def show
    send_file "#{Rails.root}/private/uploads/#{params[:file_name]}.#{params[:extension]}"
  end

  def create
  	@user.create_avatar(file_name: image_params[:file_name])
  	
  	redirect_to @user, success: 'Profile image created!'
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
