class CreateInterestedParties < ActiveRecord::Migration
  def change
    create_table :interested_parties do |t|
      t.string :parent_title
      t.string :parent_firstname
      t.string :parent_lastname
      t.string :parent_email
      t.string :parent_relationship
      t.string :child_firstname
      t.string :child_lastname
      t.string :child_dob
      t.string :child_gender

      t.timestamps
    end
  end
end
