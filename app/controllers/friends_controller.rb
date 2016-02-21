class FriendsController < BaseUserController

  def create
    if params[:user_id].to_i > 0
      @result = current_user.follow params[:user_id]
    end
    render json: {result: @result}
  end

  def destroy
    if params[:user_id].to_i > 0
      @result = current_user.unfollow params[:user_id]
    end
    render json: {result: @result}
  end
end
