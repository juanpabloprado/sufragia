class AddLastCampaignIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_campaign_id, :integer
  end
end
