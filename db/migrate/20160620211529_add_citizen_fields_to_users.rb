class AddCitizenFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :state, :integer
    add_column :users, :phone_number, :string, unique: true, null: false
    add_column :users, :phone_confirmation_token, :integer

    add_index :users, :phone_number
  end
end
