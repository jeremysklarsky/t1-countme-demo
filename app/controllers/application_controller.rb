class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session
  private
    def login(user)
      session[:user_id] = user.id 
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user
    
    def logged_in?
      !!current_user
    end

    helper_method :logged_in?

    def login_required
      if !logged_in?
        flash[:notice] = "You must be logged in!"
        redirect_to root_path
      end
    end  
end
