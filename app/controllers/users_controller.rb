class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
       session[:user_id] = @user.id
       redirect_to '/', notice: "Hello #{@user.username}! You have signed up!"

    else 
      flash[:errors] = @user.errors.full_messages
      redirect_to '/users/new'
    end
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

  def scoreboard
    @users = User.all
  end
end
