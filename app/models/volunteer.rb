class Volunteer < ActiveRecord::Base
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :why, presence: true
  validates :experience, presence: true
end
