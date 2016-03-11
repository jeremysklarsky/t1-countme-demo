class CreateMeetingUsers < ActiveRecord::Migration
  def change
    create_table :meeting_users do |t|
      t.timestamps null: false
      t.integer :user_id
      t.integer :meeting_id
      t.string :meeting_type
    end
  end
end
