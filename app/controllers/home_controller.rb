class HomeController < ApplicationController
  before_action :init_new_tweet, only: [:index]

  def index
    if params[:max_id].present?
      @tweets = current_user.twitter.home_timeline(max_id: params[:max_id])
    else
      @tweets = current_user.twitter.home_timeline
    end
  end

  private
    def init_new_tweet
      @tweet = Tweet.new
    end
end
