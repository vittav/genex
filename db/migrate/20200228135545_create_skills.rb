class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :name
      t.string :description
      t.string :level
      t.references :experience, foreign_key: true

      t.timestamps
    end
  end
end
