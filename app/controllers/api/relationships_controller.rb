class  Api::RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:id])
    current_user = User.find(params[:user_id])
    if current_user.follow!(@user)
      json_string = ::UsersSerializer.new(@user).serialized_json
      render json: json_string
    else
      render status: 422 
    end
  end

  def destroy
    @user = User.find(params[:id])
    current_user = User.find(params[:user_id])
    if current_user.unfollow!(@user)
      json_string = ::UsersSerializer.new(@user).serialized_json
      render json: json_string
    else
      render status: 422 
    end
  end
end
