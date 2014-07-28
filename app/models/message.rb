class Message
	include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :email, :comment

	validates :name, presence: true
	validates :email, presence: true, format: { with: /@/ }
	validates :comment, presence: true

	def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
end