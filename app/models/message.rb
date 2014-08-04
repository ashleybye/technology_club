class Message < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true, format: { with: /@/ }
	validates :comment, presence: true
end
