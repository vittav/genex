class CreateLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :languages do |t|
      t.string :name
      t.string :level
      t.references :experience, foreign_key: true

      t.timestamps
    end
  end
end
