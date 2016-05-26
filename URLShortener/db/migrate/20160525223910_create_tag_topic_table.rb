class CreateTagTopicTable < ActiveRecord::Migration
  def change
    create_table :tag_topic do |t|
      t.string :topic, null: false
    end
    add_index :tag_topic, :topic, unique: true
  end
end
