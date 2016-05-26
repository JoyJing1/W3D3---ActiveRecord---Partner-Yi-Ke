class CreateTaggingTable < ActiveRecord::Migration
  def change
    create_table :tagging do |t|
      t.integer :topic_id, null: false
      t.string :short_url, null: false
    end
    add_index :tagging, :topic_id
  end
end
