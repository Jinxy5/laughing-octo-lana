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

    
  #  photo_params = story_params[:file_name]

    new_params = story_params.except("file_name")

    @story = Story.new(new_params)
    @story.user_id = current_user.id

    ap "-----------------------------------------------------"
    ap story_params[:file_name] #<ActionDispatch::Http::UploadedFile:0x00000003c10630 @tempfile=#<Tempfile:/tmp/RackMultipart20140515-14377-1prg2zp>, @original_filename="Screenshot from 2014-02-09 08:12:19.png", @content_type="image/png", @headers="Content-Disposition: form-data; name=\"story[photo]\"; filename=\"Screenshot from 2014-02-09 08:12:19.png\"\r\nContent-Type: image/png\r\n">
    ap "-----------------------------------------------------"


    @story.create_photo(file_name: story_params[:file_name] ) #story_params[:file_name])

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

    if @story.update(story_params)
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
