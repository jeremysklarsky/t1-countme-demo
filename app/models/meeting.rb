class Meeting < ActiveRecord::Base

  has_many :meeting_users
  has_many :users, through: :meeting_users

  def user_count
    self.users.size
  end

  def display_name
    self.epic + ": " +self.meeting_type
  end
  
end
