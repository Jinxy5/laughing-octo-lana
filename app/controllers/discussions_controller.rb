class DiscussionsController < ApplicationController
  before_action :set_forum, only: [:create, :show]
  before_action :create_reply, only: [:show]

  before_action :set_discussion, only: :show
  
  def show
    
  end

  def create  
    @discussion = @forum.discussions.new(discussion_params)
    @discussion.user_id = current_user.id
     
    if @discussion.save
    
      redirect_to forum_path(@forum), notice: 'discussion successfully created!'
    else

      @discussions = Discussion.where(forum_id: @forum)

      flash.now[:notice] = 'oopse' 
      render "forums/show" #forum_path(@forum), notice: 'sorry, your discussion could not be saved!'
    end    
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
