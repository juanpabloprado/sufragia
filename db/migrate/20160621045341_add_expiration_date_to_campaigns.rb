class AddExpirationDateToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :expiration_date, :datetime
  end
end
