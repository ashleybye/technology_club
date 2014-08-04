class InterestedParty < ActiveRecord::Base
  validates :parent_firstname, presence: true
  validates :parent_lastname, presence: true
  validates :parent_email, presence: true, format: { with: /@/ }
  validates :parent_relationship, presence: :true
  validates :child_firstname, presence: true
  validates :child_lastname, presence: true
  validates :child_dob, presence: true, timeliness: { type: :date, before: lambda { Date.current }, before_message: "is not in the correct format" }
end
