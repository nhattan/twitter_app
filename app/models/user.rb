class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :database_authenticatable, :registerable,
    :rememberable, :trackable

  has_many :identities

  def twitter
    identities.where( :provider => "twitter" ).first
  end

  def twitter_client
    @twitter_client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter_api_key
      config.consumer_secret     = Rails.application.secrets.twitter_api_secret
      config.access_token        = twitter.access_token
      config.access_token_secret = twitter.access_token_secret
    end
  end

  def suggested_users
    slugs = twitter_client.suggestions.map(&:slug)
    twitter_client.suggest_users(slugs.sample).take(Settings.suggest_users_number)
  end

  def follow user_id
    twitter_client.follow! user_id.to_i
  end

  def unfollow user_id
    twitter_client.unfollow user_id.to_i
  end
end
