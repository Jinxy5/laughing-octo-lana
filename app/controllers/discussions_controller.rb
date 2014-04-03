class DiscussionsController < ApplicationController
  before_action :set_discussion, only: [:show, :edit, :update, :destroy]
  before_action :set_forum, only: [:show, :edit, :update, :create, :destroy, :new]

  before_action :log_impression, only: [:show]

  # GET /discussions
  # GET /discussions.json
  def index
    @discussions = Discussion.find_by(forum_id: params[:id])
  end

  # GET /discussions/1
  # GET /discussions/1.json
  def show

   # Discussion.increment_counter :view, @discussion
   #   @discussion.iterate_view
  end

  # GET /discussions/new
  def new
    @discussion = Discussion.new
  end

  # GET /discussions/1/edit
  def edit
  end

  # POST /discussions
  # POST /discussions.json
  def create
    @discussion = Discussion.new(discussion_params)

    #set the forum
    @discussion.forum_id = @forum.id

    #set the user
    @discussion.user_id = current_user.id

    respond_to do |format|
      if @discussion.save
        format.html { redirect_to [@forum, @discussion], notice: 'Discussion was successfully created.' }
        format.json { render action: 'show', status: :created, location: @discussion }
      else
        format.html { render action: 'new' }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discussions/1
  # PATCH/PUT /discussions/1.json
  def update
    respond_to do |format|
      if @discussion.update(discussion_params)
        format.html { redirect_to @discussion, notice: 'Discussion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discussions/1
  # DELETE /discussions/1.json
  def destroy
    @discussion.destroy
    respond_to do |format|
      format.html { redirect_to discussions_url }
      format.json { head :no_content }
    end
  end

  private
    def log_impression
      ip = request.remote_ip
      seen_by_network = Impression.exists?(ip_address: ip)
      seen_by_user = Impression.exists?(user_id: current_user)
      
      if !Impression.exists?(discussion_id: @discussion, ip_address: ip)

        @discussion.iterate_impression(ip)

     # elsif seen_by_network && !seen_by_user 
        
     #   @discussion.iterate_impression

      end
    end
    
    # Use callbacks to share common setup or constraints between actions.

    def set_forum
      @forum = Forum.find(params[:forum_id])
    end

    def set_discussion
      @discussion = Discussion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discussion_params
      params.require(:discussion).permit(:name, :body)
    end
end