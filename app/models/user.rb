class User < ActiveRecord::Base

  has_many :meeting_users
  has_many :meetings, through: :meeting_users

  def my_meetings
    Meeting.where(owner_id: self.id)
  end

  def points
    points = 0
    self.meetings.each do |meeting|
      if meeting.meeting_type == "T1 Breakfast"
        points += 50
      else 
        points += 100
      end
    end
    points
  end

  def attended
    self.meetings.size
  end

end