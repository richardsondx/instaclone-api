class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:id])
    current_user  = params[:user_id]
    current_user.follow!(@user)
    respond_with @user
  end

  def destroy
    @user = User.find(params[:id])
    current_user  = params[:user_id]
    current_user.unfollow!(@user)
    respond_with @user
  end
end
