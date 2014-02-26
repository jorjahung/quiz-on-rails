class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Hello #{@user.username}! You have signed up!"
      redirect_to '/'
    else 
      @users.errors
    redirect_to '/users/new'
  end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
