class TweetsController < ApplicationController

  before_action :verify_user
  def create
    flash[:notice] = current_user.tweet(tweet_params)
    redirect_to root_path
  end

  def favorite
    flash[:notice] = current_user.toggle_favorite(favorite_params)
    redirect_to root_path
  end

  def retweet
    flash[:notice] = current_user.retweet(retweet_params)
    redirect_to root_path
  end

  def unfollow
    flash[:notice] = current_user.unfollow(unfollow_params)
    redirect_to root_path
  end


  private
  def retweet_params
    params.require(:retweet).permit(:tweet_id)
  end

  def tweet_params
    params.require(:tweet).permit(:text)
  end

  def unfollow_params
    params.require(:unfollow).permit(:user_screen_name)
  end

  def favorite_params
    params.require(:favorite).permit(:tweet_id, :favorited)
  end
end
