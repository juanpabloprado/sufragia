class Vote < ActiveRecord::Base
  belongs_to :option
  belongs_to :user

  has_one :campaign, through: :option

  validate :vote_unique_per_campaign_per_option

  def to_s
    option
  end

  private

  def vote_unique_per_campaign_per_option
    if self.class.where(user_id: user_id).joins(:campaign).exists?
      errors.add :vote, 'ya votaste'
    end
  end
end
