class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|

      t.timestamps null: false
      t.string :meeting_type
      t.integer :owner_id
      t.string :epic

    end
  end
end
