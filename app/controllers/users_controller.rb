class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  before_action :secure, only: [:edit, :update, :destroy]
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    roles = Role.all
    
    @role_names = []

    roles.each do |role|
      @role_names << role.role
    end

  end

  def culminate
    register_key = params[:register_key]

    @user = User.find_by(register_key: params[:register_key])    
    raise ActiveRecord::RecordNotFound if !@user 
    
#   if user == current_user
#
# could be a lot simpler:
#
# if not current user, redirect to root. 
# if current user, and they are not culminated, culimate them. 
# if not current user, and they are culminated already, redirect to root
#
#
      if @user.culminated == false

        if register_key == @user.register_key
          @user.culminate
          redirect_to root_url, notice: 'User was successfully culminated!'
        
        else          
          redirect_to root_url, notice: 'Invalid: Key not the same!'
        end

      elsif @user.culminated
        
        redirect_to root_url, notice: 'Invalid: You\'ve already registered!' 
      
      end    
      
#    else
#      redirect_to root_url, error: 'Invalid key! (it\'s another users key!)'
#    end    



 
    

    rescue ActiveRecord::RecordNotFound
      redirect_to root_url, notice: 'Invalid: You\'ve already registered!' 
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        sign_in @user
        format.html { redirect_to @user , notice: 'Welcome to ' + request.host_with_port + ', ' + @user.user_name + '!' }
        format.json { render action: 'show', status: :created, location: @user }
      else

        ap @user


        format.html { render action: 'new', notice: 'We could not create your account! Please try again.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update

    ap params

    
#    user_params.delete_blanks!



#    @image = @user.create_avatar(file_name: user_params[:avatar][:file_name])
 

    respond_to do |format|
      #.delete avatar: [:file_name]

      if @user.update_attributes(user_params) # this automatically deletes any avatar instances, as uploaded files are saved in a seperate model
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    def secure
      redirect_to root_url unless current_user === @user || current_user.is_admin?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id]).decorate
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      # "first_name", "last_name", "nearest_town"]
      # ["id", "user_name", "email", "password_digest", "created_at", "updated_at", "register_key", "culminated", "remember_token", "register_token_created_at", "profile_image", "licence_image", "first_name", "last_name", "nearest_town"] 

      # avatar: [:file_name]
     params.require(:user).permit(:user_name,
                                  :email,
                                  :first_name,
                                  :last_name,
                                  :nearest_town,
                                  :user_name,
                                  :password,
                                  :password_confirmation,
                                  :address,
                                  :public_email,
                                  :landline,
                                  :mobile)
    end
end
