class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.references :campaign, index: true, foreign_key: true
      t.string :option
      t.text :description

      t.timestamps null: false
    end
  end
end
