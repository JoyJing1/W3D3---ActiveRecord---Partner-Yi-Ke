class Tagging < ActiveRecord::Base
  validates :topic_id, presence: true
  validates :short_url, presence: true

  belongs_to :shortened_url,
    class_name: :ShortenedUrl,
    foreign_key: :short_url,
    primary_key: :short_url

  belongs_to :tag_topic,
    class_name: :TagTopic,
    foreign_key: :topic_id,
    primary_key: :id

  def self.record_tag!(topic, short_url)
    Tagging.create!(topic_id: topic.id, short_url: short_url)
  end


end
