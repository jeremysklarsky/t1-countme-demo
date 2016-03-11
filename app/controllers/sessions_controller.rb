class SessionsController < ApplicationController

  def new
  end

  def create
    user_name = params[:user][:user_name]
    password = params[:user][:password]
    @user = User.find_or_create_by(:name => user_name)
    login(@user)
    redirect_to root_path
  end

  def destroy
    reset_session
    redirect_to root_path
  end

end