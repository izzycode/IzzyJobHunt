class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update, :destroy, :mailer]
  before_action :authorize 
  before_action :admin, only: [:index]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @company = Company.new
    @job = Job.new
    if check_to_mail?
      flash[:info] = "Congratulations! Your are ready to submit your 10/30."
    end
  end

  def search
  end

  def mail_please
    UserMailer.ten_thirty_full(set_user).deliver
    redirect_to current_user, notice: 'Email sent!'
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
  # def create
  #   @user = User.new(email:session[:userinfo].info.email,
  #               name:session[:userinfo].info.name,
  #               uid:session[:userinfo].uid)
  #   if @user.save
  #     @user.save
  #     redirect_to @user, notice: "Welcome #{@user.name}!"
  #   else
  #     redirect_to root_path, status: "Something went wrong. Let's try this again."
  #   end
  # end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to current_user, notice: 'Job was successfully updated.' }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
