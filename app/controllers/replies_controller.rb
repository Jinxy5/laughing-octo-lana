class RepliesController < ApplicationController
  before_action :set_forum, only: [:create]
  before_action :set_discussion, only: [:create]
  
  before_action :no_guests
  
  def create


    @reply = @discussion.replies.build(reply_params)
    @reply.user_id = current_user.id

    respond_to do |format|
      if @reply.save
        
        @reply.discussion.iterate_reply_count
    
        ap 'whurt (from controller)?'
        @discussion.add_follower(current_user)

        @discussion.notify_all_users(@reply, @discussion, @forum)

        format.html { redirect_to forum_discussion_path(@forum, @discussion), notice: "Your the discussion #{@discussion.name} was successfully created." }
        format.json { render action: 'show', status: :created, location: @discussion }
      else
        format.html { redirect_to forum_discussion_path(@forum, @discussion), notice: 'Your reply could not be saved' }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  private

 
    def set_forum
      @forum = Forum.find(params[:forum_id])
    end


    def set_discussion
      @discussion = Discussion.find(params[:discussion_id])
    end

#    def set

    # Never trust parameters from the scary internet, only allow the white list through.
    def reply_params
      params.require(:reply).permit(:description)
    end
end
