class AddImgurlToExperiences < ActiveRecord::Migration[5.2]
  def change
    add_column :experiences, :img_url, :string
  end
end
