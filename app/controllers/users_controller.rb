class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :send_registration_email]

  before_action :secure, only: [:edit, :update, :destroy, :send_registration_email]
 # before_action :set_up_negative_captcha, only: [:new, :create]
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    ap @user
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

    @user = User.find_by(register_key: params[:register_key])

    if @user.registered?
      redirect_to @user, notice: "This user has already confirmed their acount."
    else
      @user.register
      redirect_to @user, notice: "Thanks for confirming this user's email address !"
    end
  
  end

  def send_registration_email
    @user.send_register_email

    redirect_to @user, notice: "Email sent to #{@user.email}. If this is the wrong email, #{view_context.link_to 'click here to change your details!', edit_user_path(@user)}".html_safe
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save# && @captcha.valid?
        
        sign_in @user
        @user.send_register_email

        
        format.html { redirect_to @user , notice: 'Welcome to ' + request.host_with_port + ', ' + @user.user_name + '!' }
        format.json { render action: 'show', status: :created, location: @user }
      else



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
    def permitted_attributes
     [:user_name,
      :email,
      :first_name,
      :last_name,
      :nearest_town,
      :postcode,
      :user_name,
      :password,
      :password_confirmation,
      :address,
      :public_email,
      :landline,
      :mobile]
    end

    def set_up_negative_captcha
      @captcha = NegativeCaptcha.new(
        secret: '64e71bfa744c949556fd934d753c5f1a0c8139f05bbc62fe24c9e782f1750a02f79327eaa8460ee869328f1d3cab5ca9b7cab59752398df269c8df44089406f4',
        spinner: request.remote_ip,
        fields: permitted_attributes,
        params: params
      )
    end
    
    def secure
      redirect_to root_url unless current_user === @user || current_user.is_admin?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id]).decorate

    end



    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      ap params
      # "first_name", "last_name", "nearest_town"]
      # ["id", "user_name", "email", "password_digest", "created_at", "updated_at", "register_key", "culminated", "remember_token", "register_token_created_at", "profile_image", "licence_image", "first_name", "last_name", "nearest_town"] 

      # avatar: [:file_name]
     params.require(:user).permit(permitted_attributes)
    end
end
