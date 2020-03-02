class ChangeDateToDatetimeInMeetings < ActiveRecord::Migration[5.2]
  def change
    change_column :meetings, :scheduled_time, :datetime
  end
end
