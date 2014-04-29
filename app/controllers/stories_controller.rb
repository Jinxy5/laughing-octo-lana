class StoriesController < ApplicationController
  before_action :only_non_potentials, only: [:new, :create]

  before_action :only_admins, only: [:edit, :update]
  before_action :set_story, only: [:show, :destroy, :edit, :update]
  
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
    @story = Story.new(story_params)
    @story.user_id = current_user.id

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
      params.require(:story).permit(:title, :description)
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
