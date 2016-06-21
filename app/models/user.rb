class User < ActiveRecord::Base
  tollify
  include PhoneConfirmable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:phone_number]

  has_many :votes, dependent: :destroy
  has_many :campaigns, through: :votes

  enum role: [ :admin, :voter ]

  def email_required?
    false
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:phone_number)

    where(conditions.to_hash).where(["phone_number = :value", { :value => login }]).first
  end

  def already_voted_on_campaign?(campaign)
    campaign_ids.include?(campaign.id)
  end

end
