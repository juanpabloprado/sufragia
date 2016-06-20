class Campaign < ActiveRecord::Base
	has_many :options
	belongs_to :user
end
