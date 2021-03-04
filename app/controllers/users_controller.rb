class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def create
  end

  private

  def user_params
    params.require(user).permit(:name)
  end
end
