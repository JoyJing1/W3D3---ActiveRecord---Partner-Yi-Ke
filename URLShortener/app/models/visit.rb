class Visit < ActiveRecord::Base
  validates :user_id, presence: true
  validates :short_url, presence: true

  belongs_to :user,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id

  belongs_to :shortened_url,
    class_name: :ShortenedUrl,
    foreign_key: :short_url,
    primary_key: :short_url

  def self.record_visit!(user, shortened_url)
    Visit.create!(user_id: user.id, short_url: shortened_url)
  end

end
