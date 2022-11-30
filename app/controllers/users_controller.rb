class UsersController < ApplicationController
  def show
    @user = current_user
    # @user = User.find(params[:user_id])
    # @user = User.all
  end
end
