class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
       redirect_to '/', notice: "Hello #{@user.username}! You have signed up!"
    else 
      @user.errors.each do |error|
        @user.errors[error].flatten.each {|notice| flash[:notice] = error.to_s.capitalize+" "+ notice }
      end
      redirect_to '/users/new'
    end
  end

  def user_params
    puts "Params&&&&&&&&&&&&&"
    puts params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
