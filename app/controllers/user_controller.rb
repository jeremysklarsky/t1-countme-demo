class UserController < ApplicationController

  def checkin
    @meeting = Meeting.where(epic: params[:epic], meeting_type: params[:meeting_type]).first
    @checkin = MeetingUser.new(user_id: current_user.id, meeting_id: @meeting.id)
    @checkin.save
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end    
  end

  def hipchat
    message = params[:body][:item][:message][:message].split(" ")
    if message.first == '/checkin'
      @user = User.find_by_name(message[1])
      @meeting = Meeting.where(epic: message[2], meeting_type: 'T1 Breakfast').first
      @checkin = MeetingUser.new(user_id: @user.id, meeting_id: @meeting.id)
      @checkin.save
    end

      render status: 200, json: {
        message: "Successfully checked in.",
      }.to_json
  end

end
