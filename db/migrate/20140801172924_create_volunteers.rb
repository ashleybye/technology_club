class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.text :why
      t.text :experience
      t.text :comments

      t.timestamps
    end
  end
end
