class AddPhoneNumberToVolunteer < ActiveRecord::Migration
  def change
    add_column :volunteers, :phone_no, :string
  end
end
