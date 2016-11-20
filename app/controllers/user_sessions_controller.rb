class UserSessionsController < ApplicationController

  def new
    redirect_to current_user if current_user
  end

  def create
    user = User.where(username: username).first
    if user && user.authenticate(password)
      session[:user_id] = user.id
      # should really save where they were trying to go
      redirect_to user
    else
      flash.alert = "Bad username/password combination"
      redirect_to '/sessions/new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end

  def username
    session_params[:username]
  end

  def password
    session_params[:password]
  end
end
