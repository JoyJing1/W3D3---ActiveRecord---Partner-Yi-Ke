class AddBiIndex < ActiveRecord::Migration
  def change
    add_index :taggings, [:topic_id, :short_url], unique: true
  end
end
