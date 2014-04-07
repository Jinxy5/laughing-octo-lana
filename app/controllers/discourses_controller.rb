class DiscoursesController < ApplicationController
  before_action :set_discourse, only: [:show, :edit, :update, :destroy]
  #before_action :create
  before_action :set_forum, only: [:show, :edit, :update, :create, :destroy, :new]
  before_action :create_reply, only: [:show]

  before_action :log_impression, only: [:show]

  # GET /discources
  # GET /discources.json
  def index
    @discources = Discourse.find_by(forum_id: params[:id])
  end

  # GET /discources/1
  # GET /discources/1.json
  def show
#    @discourse = Discourse.new

    @reply = Discourse.new
   # @reply = @discourse.reply.new
   # discourse.increment_counter :view, @discourse
   #   @discourse.iterate_view
  end

  # GET /discources/new
  def new

    @discourse = Discourse.new
  end

  # GET /discources/1/edit
  def edit
  end

  # POST /discources
  # POST /discources.json
  def create
    @discourse = Discourse.new(discourse_params)

    #set the forum
    @discourse.forum_id = @forum.id

    #set the user
    @discourse.user_id = current_user.id

    respond_to do |format|
      if @discourse.save
        format.html { redirect_to [@forum, @discourse], notice: 'discourse was successfully created.' }
        format.json { render action: 'show', status: :created, location: @discourse }
      else
        format.html { render action: 'new' }
        format.json { render json: @discourse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discources/1
  # PATCH/PUT /discources/1.json
  def update
    respond_to do |format|
      if @discourse.update(discourse_params)
        format.html { redirect_to @discourse, notice: 'discourse was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @discourse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discources/1
  # DELETE /discources/1.json
  def destroy
    @discourse.destroy
    respond_to do |format|
      format.html { redirect_to discources_url }
      format.json { head :no_content }
    end
  end

  private
    def log_impression
      ip = request.remote_ip
      seen_by_network = Impression.exists?(ip_address: ip)
      seen_by_user = Impression.exists?(user_id: current_user)
      
      if !Impression.exists?(discourse_id: @discourse, ip_address: ip)

        @discourse.iterate_impression(ip)

     # elsif seen_by_network && !seen_by_user 
        
     #   @discourse.iterate_impression

      end
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def create_reply 
    end

    def set_forum
      @forum = Forum.find(params[:forum_id])
    end

    def set_discourse
      @discourse = Discourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discourse_params
      params.require(:discourse).permit(:title, :body)
    end
end
