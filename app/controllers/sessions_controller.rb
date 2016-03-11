class SessionsController < ApplicationController

  def new
  end

  def create
    user_name = params[:user][:user_name]
    password = params[:user][:password]
    @response = Unirest.post "https://t1qa13.mediamath.com/api/v2.0/login",
    parameters:{
      "api_key" => ENV['api_key'],
      "user" => user_name,
      "password" => password
    }
    
    result = Hash.from_xml(@response.body)

    if result["result"]["status"]["code"] == "ok"
      @user = User.find_or_create_by(:name => params[:user][:user_name])
      login(@user)
      redirect_to root_path
    else
      flash.now[:notice] = "User name or password is not valid."
      render 'new'
    end

  end

  def destroy
    reset_session
    redirect_to root_path
  end

end