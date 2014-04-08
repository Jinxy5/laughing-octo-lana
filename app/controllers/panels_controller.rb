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

    ap '^--^'
    ap user_params

    user_params.delete_blanks!


    @image = @user.create_avatar(file_name: user_params[:avatar][:file_name])
 


    respond_to do |format|
      if @user.update_attributes(user_params.delete avatar: [:file_name]) # this automatically deletes any avatar instances, as uploaded files are saved in a seperate model
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

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

     params.require(:user)#.permit(:user_name, :email, :first_name, :last_name, :nearest_town, :user_name, :password, :password_confirmation, avatar: [:file_name])
    end
end
