class AddSegmentsToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :segments, :jsonb, default: '{}'
  end
end
