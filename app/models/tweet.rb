class Tweet < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :body, presence: true

  before_create :post_to_twitter
  before_destroy :remove_from_twitter

  def post_to_twitter
    tweet = user.twitter_client.update(body)
    self.tweet_id = tweet.id
  end

  def remove_from_twitter
    user.twitter_client.destroy_status(self.tweet_id)
  end

end
