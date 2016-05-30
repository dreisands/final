class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.save
    redirect_to games_url
  end

  def destroy
    User.delete(params[:id])
    redirect_to users_url
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :salt, :encrypted_password)
  end
end