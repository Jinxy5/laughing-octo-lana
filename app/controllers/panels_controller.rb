class PanelsController < ApplicationController
  before_action :secure
  
  before_action :set_all_users, only: [:user_delete, :users]

  before_action :set_user, only: [:user_delete, :user_update]
  before_action :protect_admin, only: [:user_delete, :user_update]
  
  def users
  end

  def user_delete
      
     
     
       @user.destroy
       respond_to do |format|
          format.html { redirect_to panel_show_users_url, notice: 'User successfully deleted' }
          format.json { head :no_content }
        end

  end


  def user_update

    user_params.each do |p|
      @user.add_role(p[0]) if p[1] == "1" && !@user.has_role?(p[0])_
 #     @user.remove_role(p[0]) if p[1] == "0"
    end 

   redirect_to panel_show_users_url, notice: 'User was successfully updated.'

  end

  private
    
    def protect_admin
      redirect_to(panel_show_users_url, notice: 'You lack the privaledges to alter an admin') if @user.is_admin? 
    end

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

     params.require(:user).permit(:coordinator, :midweek, :rider)
    end
end
