class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.integer :age
      t.string :location

      t.timestamps
    end
  end
end
