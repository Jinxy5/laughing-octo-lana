class PanelsController < ApplicationController
  before_action :secure
  
  before_action :set_all_users, only: [:user_delete, :users]
  before_action :set_user, only: [:user_delete]
  
  def users
  end

  def user_delete
  
     @user.destroy
      respond_to do |format|
        format.html { redirect_to panel_show_users_url, notice: 'User successfully deleted' }
        format.json { head :no_content }
      end

  end

  private
    def set_all_users
      @users = User.all
    end

    def secure
      redirect_to root_url if !current_user.is_admin?
    end

    def set_user
      @user = User.find(params[:id])
    end

    def user_params

     params.require(:user).permit(:user_name, :email, :first_name, :last_name, :nearest_town, :user_name, :password, :password_confirmation, avatar: [:file_name])
    end
end
