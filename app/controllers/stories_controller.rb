class StoriesController < ApplicationController
  before_action :only_non_potentials, only: [:new, :create]

  before_action :only_admins, only: [:edit, :update]
  before_action :set_story, only: [:show, :destroy, :edit, :update]
  
#  before_action :_story, only: [:edit]
  def index
    @stories = Story.approved.paginate(page: params[:page], per_page: 10)
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
  end

 
  def create
    new_params = story_params.except("file_name")

    @story = Story.new(new_params)
    @story.user_id = current_user.id

    if story_params[:file_name]
      @story.create_photo(file_name: story_params[:file_name] ) 
    end

    if @story.save
      redirect_to root_path, notice: "Thanks! Your story, '#{@story.title}' has been submitted and may be published by an administrator!"
    else
      render 'new', notice: 'Sorry! Your story could not be published!'
    end
  end

  def destroy
    @story.destroy
 
    redirect_to panel_show_stories_path, notice: "Successfully deleted #{@story.title} "
  end

  def edit
    render template: 'panels/edit_story'
  end

  def update




    new_params = story_params.except("file_name")

    if story_params[:file_name]
      @story.create_photo(file_name: story_params[:file_name] ) 
    end


    if @story.update(new_params)
      @story.approve
      redirect_to splash_news_path, notice: "Successfully updated #{@story.title} " 
    else
    end
  end

#  def update
#  end

  private
    def only_admins
      redirect_to root_path unless current_user.is_admin?
    end

    def set_story
      @story = Story.find(params[:id])
    end

    def only_non_potentials
      redirect_to(root_path, notice: 'Sorry, only trusted users can enter stories!') if current_user.is_only_potential?
    end

    def protect_admin
      redirect_to(panel_show_users_url, notice: 'You lack the privileges needed to alter an admin') if @user.is_admin? 
    end

    def set_all_users
     @users = User.all.paginate(page: params[:page], per_page: 10)
    end

    def story_params
      params.require(:story).permit(:title, :description, :file_name)
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
