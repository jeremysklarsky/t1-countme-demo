class WelcomeController < ApplicationController

  def index
    if current_user
      @welcome_message = "Welcome, #{current_user.name}"
    else 
      redirect_to login_path
    end

  end

end
