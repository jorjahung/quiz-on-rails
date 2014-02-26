class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/', :notice => "Signed in as #{user.username}" 
    else
      flash.now.alert = "Invalid email or password"
      render 'new'
    end
  end
end
