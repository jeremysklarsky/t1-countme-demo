class UserController < ApplicationController
  skip_before_action :verify_authenticity_token

  def checkin
    @meeting = Meeting.where(epic: params[:epic], meeting_type: params[:meeting_type]).first
    @checkin = MeetingUser.new(user_id: current_user.id, meeting_id: @meeting.id)
    @checkin.save
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

  def hipchat
    message = hip_params[:item][:message][:message].split(" ")
    if message.first == '/checkin'
      @hipchat_id = hip_params["item"]["message"]["from"]["id"]
      @username = finduser(@hipchat_id)
      @meeting = Meeting.where(epic: message[1], meeting_type: 'T1 Breakfast').first
      @user = User.find_or_create_by(name: @username)
      @checkin = MeetingUser.new(user_id: @user.id, meeting_id: @meeting.id)
      @checkin.save
    end

      render status: 200, json: {
        message: "Successfully checked in.",
      }.to_json
  end

  def finduser(id)
    # url = "https://api.hipchat.com/v2/user/?auth_token=YOUR_TOKEN"
    @response = Unirest.get "https://api.hipchat.com/v2/user/#{id}?auth_token=#{ENV['hipchat_token']}"
    @response.body["email"].split("@").first
  end

private
  def hip_params
    params.require(:item).permit!
  end

end
