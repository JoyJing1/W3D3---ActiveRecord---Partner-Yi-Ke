class CreateVisitsTable < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :short_url, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :visits, :short_url
    add_index :visits, :user_id
  end
end
