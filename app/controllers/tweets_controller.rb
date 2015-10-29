class TweetsController < ApplicationController

  before_action :verify_user
  def create
    begin
      flash[:notice] = "Posted"
      twitter_api.client(current_user).update(tweet_text)
    rescue StandardError => e
      flash[:notice] = e.to_s
    end
    redirect_to root_path
  end

  def favorite
    toggle_favorite

    redirect_to root_path
  end

  def retweet
    begin
      flash[:notice] = "retweeted"
      twitter_api.client(current_user).retweet(retweet_params[:tweet_id])
    rescue StandardError => e
      flash[:notice] = e.to_s
    end
    redirect_to root_path
  end

  def unfollow
    begin
      flash[:notice] = "unfollowed"
      binding.pry
      twitter_api.client(current_user).unfollow(unfollow_params[:user_screen_name])
    rescue StandardError => e
      flash[:notice] = e.to_s
    end
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

  def tweet_text
    tweet_params[:text]
  end

  def favorite_params
    params.require(:favorite).permit(:tweet_id, :favorited)
  end

  def favorited
    favorite_params[:favorited]
  end

  def favorite_tweet_id
    favorite_params[:tweet_id]
  end

  def toggle_favorite
    toggle = {
      "false" => lambda { twitter_api.client(current_user).
                          favorite(favorite_tweet_id) },

      "true"  => lambda { twitter_api.client(current_user).
                          unfavorite(favorite_tweet_id) }
    }
    toggle[favorited].call
  end
end
