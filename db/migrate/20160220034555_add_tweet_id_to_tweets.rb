class AddTweetIdToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :tweet_id, :integer, limit: 8
  end
end
