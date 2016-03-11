class MeetingController < ApplicationController

  def new
    @meetings = current_user.my_meetings
  end

  def create

    types = ['1:1', 'T1 Breakfast', 'Group Interview', 'Design']
    types.each do |type|
      meeting = Meeting.new
      meeting.epic = params[:epic]
      meeting.meeting_type = type
      meeting.owner_id = current_user.id
      meeting.save
    end

    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end    

  end

  def checkin
    @users = User.all.sort_by{|user|user.points}.reverse
  end

end
