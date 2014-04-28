class ForumsController < ApplicationController
  before_action :set_forum, only: [:show, :edit, :update, :destroy]
  before_action :check_role, except: [:index]

  # GET /forums
  # GET /forums.json
  def index
    @forums = Forum.all
  end

  # GET /forums/1
  # GET /forums/1.json
  def show
#    @discussion.replies.paginate(page: params[:page], per_page: 10)
 
    @discussions = @forum.discussions.paginate(page: params[:page], per_page: 10)
    @discussion = Discussion.new
  end

  # GET /forums/new
  def new
    @forum = Forum.new
  end

  # GET /forums/1/edit
  def edit
  end

  # POST /forums
  # POST /forums.json
  def create
    @forum = Forum.new(forum_params)

    respond_to do |format|
      if @forum.save
        format.html { redirect_to @forum, notice: 'Forum was successfully created.' }
        format.json { render action: 'show', status: :created, location: @forum }
      else
        format.html { render action: 'new' }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forums/1
  # PATCH/PUT /forums/1.json
  def update
    respond_to do |format|
      if @forum.update(forum_params)
        format.html { redirect_to @forum, notice: 'Forum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forums/1
  # DELETE /forums/1.json
  def destroy
    @forum.destroy
    respond_to do |format|
      format.html { redirect_to forums_url }
      format.json { head :no_content }
    end
  end

  private
    def check_role
      
      # find a better way to create an array
#      ap @forum.user_allowed?(current_user)

      unless @forum.user_allowed?(current_user) || current_user.is_admin?


        redirect_to forums_path, notice: 'Sorry! You cannot enter this forum! This forum is for users with a type of: ' + @forum.list_roles + ' and your roles are: ' + current_user.list_roles
      end
     # ap current_user.roles.any? { |role| role[:role] == 'potentialzzz' || 'potential'}

    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_forum
      @forum = Forum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forum_params
      params.require(:forum).permit(:name)
    end
end
