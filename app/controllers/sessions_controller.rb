class SessionsController < ApplicationController

  def new
  end

  def create
# <<<<<<< HEAD
    @user_name = params["user"]["user_name"]
    @password = params["user"]["password"]
    # @response = Unirest.post "https://t1qa13.mediamath.com/api/v2.0/login",
    # headers:{ "Accept" => "application/json" },
    # parameters:{
    #   "api_key" => ENV['api_key'],
    #   "user" => @user_name,
    #   "password" => @password
    # }

#     new_params = {'api_key' => ENV['api_key'], 'user' => @user_name, 'password' => @password}
#     url = URI.parse('https://t1qa13.mediamath.com/api/v2.0/login')
#     resp, data = Net::HTTP.post_form(url, new_params)

#     # puts resp.body
#     binding.pry
#     # if @response.code == 200   
#     if resp.body.include?("ok")
#       @user = User.find_or_create_by(:name => @user_name)
#       login(@user)
#       redirect_to root_path
#     else
#       flash.now[:notice] = "User name or password is not valid."
#       render 'new'
#     end
#      # respond_to do |format|
#      #  format.js  # index.html.erb
#     # end 

# #    # xml  = Nokogiri::XML(@response.body)


# =======
    user_name = params[:user][:user_name]
    password = params[:user][:password]
    @user = User.find_or_create_by(:name => user_name)
    login(@user)
    respond_to do |format|
      format.js {render inline: "location.href = ('/');" }
    end
    
# >>>>>>> no-auth
  end

  def destroy
    reset_session
    redirect_to root_path
  end

end