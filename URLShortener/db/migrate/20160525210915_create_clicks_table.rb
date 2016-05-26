class CreateClicksTable < ActiveRecord::Migration
  def change
    create_table :clicks do |t|
      t.integer :user_id, null: false
      t.string :short_url, null: false

      t.timestamps
    end

    add_index :clicks, :user_id
    add_index :clicks, :short_url
  end
end
