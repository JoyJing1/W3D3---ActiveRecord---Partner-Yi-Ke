class Click < ActiveRecord::Base
  validates :user_id, :short_url, presence: true

  belongs_to :user,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id

  belongs_to :shortened_url,
    class_name: :ShortenedUrl,
    foreign_key: :short_url,
    primary_key: :short_url

  def self.record_click!(user, short_url)
    Click.create!(user_id: user.id, short_url: short_url)
  end
end
