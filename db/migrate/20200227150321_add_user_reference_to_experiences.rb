class AddUserReferenceToExperiences < ActiveRecord::Migration[5.2]
  def change
    add_reference :experiences, :user, index: true
  end
end
