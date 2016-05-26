class ReCreateTagTopicTable < ActiveRecord::Migration
  def change
    drop_table :tag_topic_tables
    
    create_table :tag_topic do |t|
      t.string :topic, null: false
    end
    add_index :tag_topic, :topic, unique: true
  end
end
