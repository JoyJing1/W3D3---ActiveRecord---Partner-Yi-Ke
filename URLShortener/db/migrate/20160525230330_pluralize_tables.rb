class PluralizeTables < ActiveRecord::Migration
  def change

    drop_table :tag_topic

    create_table :tag_topics do |t|
      t.string :topic, null: false
    end
    add_index :tag_topics, :topic, unique: true


    drop_table :tagging

    create_table :taggings do |t|
      t.integer :topic_id, null: false
      t.string :short_url, null: false
    end
    add_index :taggings, :topic_id


  end
end
