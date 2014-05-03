class DiscussionsController < ApplicationController
  before_action :set_forum, only: [:create, :show, :show_followers]
  before_action :create_reply, only: [:show]

  before_action :set_discussion, only: [:show, :show_followers, :create_follower, :delete_follower]
  
  before_action :no_guests
  
  def show
    @discussion.iterate_view(request.remote_ip, current_user)
    @replies = @discussion.replies.paginate(page: params[:page], per_page: 10)
  end

  def create  
    @discussion = @forum.discussions.new(discussion_params)
    @discussion.user_id = current_user.id
     
    if @discussion.save
    
      redirect_to forum_path(@forum), notice: 'discussion successfully created!'
    else

      @discussions = Discussion.where(forum_id: @forum)
      @discussions = @forum.discussions.paginate(page: params[:page], per_page: 10, order: 'created_at desc')

      flash.now[:notice] = 'Discussion could not be saved' 
      render "forums/show" #forum_path(@forum), notice: 'sorry, your discussion could not be saved!'
    end    
  end

  def show_followers
    @followers = @discussion.followers
  end

  def create_follower
    @discussion.add_follower(current_user)
    redirect_to forum_discussion_url(@discussion.forum, @discussion), notice: "You are now following #{@discussion.name}"
  end

  def delete_follower
    @discussion.delete_follower(current_user)
    redirect_to forum_discussion_url(@discussion.forum, @discussion), notice: "You are no longer following #{@discussion.name}"
  end

  def update
  #  @discussion.update(discussion_params)

  #  ap 'hmmm'

#    redirect_to forum_path(@forum)
  end



  private
    
    def create_reply
      @reply = Reply.new  
    end

    def set_forum
      @forum = Forum.find(params[:forum_id]).decorate
    end

    def set_discussion
      @discussion = Discussion.find(params[:id]).decorate
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discussion_params
      params.require(:discussion).permit(:name, :description)
    end

end
