require 'net/http'
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

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
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
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
    @productions = Production.all
    url = 'https://sms.ru/sms/send?api_id=61BEDD63-465C-25F5-9AD4-6E58B45B31DF&to='+@user.telephone+'&msg='+@user.id.to_s+'&json=1'
    uri = URI.parse(url)
    if @user.full_name == nil
    response = Net::HTTP.get_response(uri)
end
    @user.update(user_params)
    respond_to do |format|
      if @user.full_name == @user.id.to_s
        format.html { redirect_to "/users/sign_in", notice:"Your phone number was successfully verified"}
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, notice:"Incorrect code"}
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
      params.require(:user).permit(:email, :password, :password_confirmation, :full_name, :role)
    end
end
