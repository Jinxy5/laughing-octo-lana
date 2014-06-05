class PanelsController < ApplicationController
  before_action :secure
  
  before_action :set_all_users, only: [:user_delete, :users]
  before_action :set_all_users, only: [:stories, :users]

  before_action :set_all_stories, only: [:stories]

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

    flash_message = 'User <b>' + @user.user_name + '</b> was successfully altered: </br>'

    changed = false

    user_params.each do |p|
      
      if p[1] == "1" && !@user.has_role?(p[0])
        @user.add_role(p[0])

        flash_message << p[0] + ' added </br>'
        
        changed = true
      end

      if p[1] == "0" && @user.has_role?(p[0])
        @user.remove_role(p[0])  

        flash_message << p[0] + ' removed <br>'
        
        changed = true
      end


    end 

    flash_message = '' << '<b>' + @user.user_name + '\'s</b> roles have not been changed as your update doesn\'t change their already existing roles! </br>' unless changed

    flash_message << '<b>' + @user.user_name + '\'s</b> roles are currently: ' + @user.list_roles 

   redirect_to panel_show_users_url, notice: flash_message.html_safe

  end


  def stories
  end

  def pages
    @pages = Page.all
  end

  def edit_story

  end

  def media
  end

  def asd
  end

  def media_update
    
    ap params

    @field = Field.find(params[:id])
=begin
respond_to do |format|
      if @reservation.save
        format.html do
          redirect_to '/'
        end
        format.json { render json: @reservation.to_json }
        else
        format.html { render 'new'} ## Specify the format in which you are rendering "new" page
        format.json { render json: @reservation.errors } ## You might want to specify a json format as well
        end
      end
     end
=end
    respond_to do |format|
      if @field.update(field_params)
        format.html { redirect_to panel_show_pages_url, notice: "#{@field.name} was successfully updated." }
  #      format.json { head :no_content }
      else
        format.html { render action: 'edit' }
   #     format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end

  #  @field = Field.find(field_params)

  #  if @field.update(field_params)
  #    redirect_to panel_show_field_url, notice: "Updated #{@field.name}"
  #  else
  #    redirect_to panel_show_field_url, notice: "Could not update #{@field.name}"
  #  end
  end

  def media_edit
    @field = Field.find(params[:id])
    #render 'panels/media_edit'
  end


  private
    
    def protect_admin
      redirect_to(panel_show_users_url, notice: 'You lack the privileges needed to alter an admin') if @user.is_admin? 
    end

    def set_all_stories
      @stories = Story.all.paginate(page: params[:page], per_page: 10).decorate
    end

    def set_all_users
     @users = User.all.paginate(page: params[:page], per_page: 10)
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

    def field_params
      params.require(:field).permit(:content)
    end

    def story_params
      ap params
      params.require(:story).permit(:stuff)
    end
end
