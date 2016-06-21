class Campaign < ActiveRecord::Base
	has_many :options
	belongs_to :user

	accepts_nested_attributes_for :options

	def target_users
		User.where(properties: segments.to_json).pluck(:phone_number)
	end

	def target_phone_numbers
		User.where(properties: segments.to_json).pluck(:phone_number)
	end
end
