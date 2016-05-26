class CreateShortenedUrlsTable < ActiveRecord::Migration
  def change
    create_table :shortened_urls_tables do |t|
      t.string :long_url
      t.string :short_url
      t.integer :user_id

      t.timestamps
    end

    add_index :shortened_urls_tables, :user_id
    add_index :shortened_urls_tables, :short_url, unique: true
  end
end
