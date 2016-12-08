class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]
before_action :authorize, except: [:create, :new, :twitter]
# GET /users
# GET /users.json
def index
  # @social = TwitterDatum.all.order(followers_count: :desc)
  # @users = []
  # @social.each do |stat|
  #   @users << User.find(stat.user_id)
  # end

  # puts @users
  @users = User.includes(:twitter_datum).order('twitter_data.followers_count')
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
end

# POST /users
# POST /users.json
def create
  @user = User.new(user_params)

  respond_to do |format|
    if @user.save
      UserMailer.welcome_email(@user).deliver_now

      session[:user_id] = @user.id
      format.html { redirect_to @user, notice: 'User was successfully created.' }
      format.json { render :show, status: :created, location: @user }
    else
      format.html { render :new }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end

# PATCH/PUT /users/1
# PATCH/PUT /users/1.json
def update
  respond_to do |format|
    if @user.update(user_params)
      format.html { redirect_to @user, notice: 'User was successfully updated.' }
      format.json { render :show, status: :ok, location: @user }
    else
      format.html { render :edit }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE /users/1
# DELETE /users/1.json
def destroy
  @user.destroy
  respond_to do |format|
    format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    format.json { head :no_content }
  end
end

def search
  query = {
    kind: 'Ambassador',
    age: params[:age],
    category: params[:category],
    gender: params[:gender]
  }.reject { |k, v| v == 'Any' }

  age = params[:age]
  category = params[:category]
  gender = params[:gender]

  @users = User.includes(:twitter_datum).where(query).order('twitter_data.followers_count DESC')

end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :category, :kind, :summary, :age, :gender)
  end

  def authorize
    if @current_user.nil?
      redirect_to login_url, alert: "Not authorized! Please log in."
    elsif @user != @current_user && @current_user.kind != "Brand"
        redirect_to controller: 'users', action: 'show', id: @current_user.id, notice: "Not authorized! Only #{@user} has access to this post."
    end
  end

end
