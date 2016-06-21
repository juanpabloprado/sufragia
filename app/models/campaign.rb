class Campaign < ActiveRecord::Base
	has_many :options
	belongs_to :user

  default_scope order(:created_at => :desc)

	accepts_nested_attributes_for :options

  def to_param
    "#{id}-#{name}".parameterize
  end

	def target_users
		User.where(properties: segments.to_json).pluck(:phone_number)
	end

	def target_phone_numbers
		User.where(properties: segments.to_json).pluck(:phone_number)
	end
end
