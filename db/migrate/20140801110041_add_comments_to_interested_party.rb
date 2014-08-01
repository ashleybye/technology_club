class AddCommentsToInterestedParty < ActiveRecord::Migration
  def change
    add_column :interested_parties, :comments, :text
  end
end
