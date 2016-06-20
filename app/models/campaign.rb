class Campaign < ActiveRecord::Base
	has_many :options
	belongs_to :user


	def target_users
		User.where(properties: segments.to_json)
	end
end
