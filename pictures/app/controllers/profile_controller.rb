class ProfileController < ApplicationController
  def show
    @posts = User.find_by(id: params[:user_id]).posts
    @user = User.find_by(id: params[:user_id])
  end
end
