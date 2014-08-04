class Volunteer < ActiveRecord::Base
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :phone_no, allow_blank: true, format: { with: /[0-9]{11}|[0-9]{5} [0-9]{6}/ }
  validates :why, presence: true
  validates :experience, presence: true

  before_save { phone_no.gsub!(/\s+/, "") }
end
