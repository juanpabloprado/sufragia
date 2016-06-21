class Campaign < ActiveRecord::Base
	has_many :options
	belongs_to :user
	has_many :votes, through: :options

  after_create :notify_users!

  default_scope -> { order(:created_at => :desc) }

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

	def expired?
		Date::today() > expiration_date
	end

  private

  def notify_users!
    User.all.each do |u|
      u.update_attribute(:last_campaign_id, self.id)
      SmsSlave.campaign_vote_request(self, u)
    end
  end

end
