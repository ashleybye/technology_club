class User < ActiveRecord::Base
  has_secure_password

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, format: { with: /@/ }, uniqueness: { case_sensitive: false }

  before_save { email.downcase! }

  private

  	def self.authenticate(email, password)
  		user = User.find_by(email: email)
  		user && user.authenticate(password)
  	end

end
