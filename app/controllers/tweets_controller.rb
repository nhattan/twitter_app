class TweetsController < BaseUserController
  def index
    if params[:since_id].present?
      @tweets = current_user.twitter_client.user_timeline(since_id: params[:since_id])
    elsif params[:max_id].present?
      @tweets = current_user.twitter_client.user_timeline(max_id: params[:max_id])
    else
      @tweets = current_user.twitter_client.user_timeline
    end
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    @tweet.save
    @tweet = current_user.twitter_client.status @tweet.tweet_id
    respond_to do |format|
      format.html {redirect_to root_path}
    end
  end

  private

    def tweet_params
      params.require(:tweet).permit(:user_id, :body)
    end
end
