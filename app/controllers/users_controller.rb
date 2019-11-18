class UsersController < ApplicationController
  def create
    @user = User.new(name: params[:name], username: params[:username])
    respond_with(@user)
  end
  
  def followers
    user = User.find(params[:id])
    @followers = user.followers
    respond_with(@followers)
  end
end
