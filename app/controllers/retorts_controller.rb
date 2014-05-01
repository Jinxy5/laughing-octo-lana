class RetortsController < ApplicationController
  before_action :set_forum, only: [:create]
  before_action :set_discourse, only: [:create]
  
  def create
    ap "-*-*-*"
    ap params_hash
    ap "-*-*-*"

    ap discourse_params

    @discourse.replies.build(discourse_params).user_id = current_user.id

    respond_to do |format|
      if @discourse.save
        format.html { redirect_to forum_discussion_path(@forum, @discourse), notice: 'reply was successfully created.' }
        format.json { render action: 'show', status: :created, location: @discourse }
      else
        format.html { render action: 'new' }
        format.json { render json: @discourse.errors, status: :unprocessable_entity }
      end
    end
  end

  private
 
    def set_forum
      @forum = Forum.find(params[:forum_id])
    end

    def set_discourse
      @discourse = Discourse.find(params[:discourse_id])
    end

#    def set

    # Never trust parameters from the scary internet, only allow the white list through.
    def discourse_params
      params.require(:discourse).permit(:title, :body)
    end
end
