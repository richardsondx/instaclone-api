class  Api::UsersController < ApplicationController
  def create
    @user = User.new(name: params[:name], username: params[:username])
    if @user.save
      json_string = ::UsersSerializer.new(@user).serialized_json
      render json: json_string
    else
      render status: 422 
    end
  end
  
  def followers
    user = User.find(params[:user_id])
    @followers = user.followers
    json_string = ::UsersSerializer.new(@followers).serialized_json
    if @followers
      render json: json_string
    else 
      render status: 422 
    end
  end
end
