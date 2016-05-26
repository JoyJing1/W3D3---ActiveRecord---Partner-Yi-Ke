class TagTopic < ActiveRecord::Base
  validates :topic, presence: true, uniqueness: true

  has_many :taggings,
    class_name: :Tagging,
    foreign_key: :topic_id,
    primary_key: :id

  has_many :shortened_urls,
    through: :taggings,
    source: :shortened_url

  def num_links
    shortened_urls.count
  end

  def most_popular_link
    max_url = nil
    max_visits = 0
    shortened_urls.each do |shortened_url|
      visits = shortened_url.num_uniques
      if visits > max_visits
        max_visits = visits
        max_url = shortened_url.long_url
      end
    end
    max_url
  end

end
