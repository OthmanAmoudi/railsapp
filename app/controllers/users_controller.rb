class UsersController < ApplicationController

#  before_action :authenticate_user!, except: [:create, :destroy]
  def show
    @user = User.find_by(username: params[:username])
    @tweets = @user.tweets
  end

  def all
    @users = User.all
  end

  def create
    user = User.find_by(username: params[:username])
    Follow.create(followable: user, follower: current_user)
    redirect_to user_path(user.username), notice: "Succesfully Follwed this user"
  end

  def destroy
    user = User.find_by(username: params[:username])
    Follow.find_by(followable: user, follower: current_user).destroy
    redirect_to user_path(user.username), notice: "Succesfully Unfollwed this user"
  end

end
