class InterestedParty < ActiveRecord::Base
  validates :parent_firstname, presence: true
  validates :parent_lastname, presence: true
  validates :parent_email, presence: true
  validates :child_firstname, presence: true
  validates :child_lastname, presence: true
end