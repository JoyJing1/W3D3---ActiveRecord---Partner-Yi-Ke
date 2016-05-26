require 'securerandom'

class ShortenedUrl < ActiveRecord::Base

  validates :short_url, presence: true, uniqueness: true
  validates :user_id, presence: true
  validates :long_url, presence: true, length: {maximum: 1024}
  validate :max_5_submissions

  belongs_to :submitter,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id

  has_many :visits,
    class_name: :Visit,
    foreign_key: :short_url,
    primary_key: :short_url

  has_many :uniq_visitors,
    -> { distinct },
    through: :visits,
    source: :user

  has_many :visitors,
    class_name: :Visit,
    through: :visits,
    source: :user

  has_many :clicks,
    class_name: :Click,
    foreign_key: :short_url,
    primary_key: :short_url

  def max_5_submissions
    user = User.find_by_id(user_id)
    if user.num_recent_submissions >= 1 && user.premium == false
      errors[:user] << "can't add more than 5 shortened urls per minute"
    end
  end

  def self.random_code
    curr_short_url = SecureRandom::urlsafe_base64
    if exists?( short_url: curr_short_url )
      curr_short_url = ShortenedURL.random_code
    end
    curr_short_url
  end

  def self.create_for_user_and_long_url!(user, long_url)
    short_url = ShortenedUrl.random_code
    ShortenedUrl.create!(long_url: long_url, short_url: short_url, user_id: user.id)
  end

  def num_clicks
    clicks.length
  end

  def num_uniques
    clicks.select(:user_id).distinct.count
  end

  def num_uniques_via_assc
    uniq_visitors.count
  end

  def num_recent_uniques
    clicks.where("created_at > ?", 10.minutes.ago).select(:user_id).distinct.count
  end

end
