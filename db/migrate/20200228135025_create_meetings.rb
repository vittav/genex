class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.date :scheduled_time
      t.string :location
      t.references :user, foreign_key: true
      t.references :experience, foreign_key: true

      t.timestamps
    end
  end
end
