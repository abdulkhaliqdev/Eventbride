class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'User was successfully created.'
    else
      render :new, alert: 'Unable to create the User'
    end
  end

  def show
    @user = User.find(params[:id])
    @created_events = current_user.created_events
    @past_events = current_user.attended_event.past
    @upcoming_events = current_user.attended_event.upcoming
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
