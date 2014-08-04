class AddSessionTimeToInterestedParties < ActiveRecord::Migration
  def change
    add_column :interested_parties, :session_time, :string
  end
end
