class TweetsController < ApplicationController

  before_action :verify_user
  def create
    begin
      flash[:notice] = "Posted"
      something = twitter_api.client(current_user).update(tweet_text)
    rescue StandardError => e
      flash[:notice] = e.to_s
    end
    redirect_to root_path
  end

  def favorite
    toggle_favorite

    redirect_to root_path
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text)
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

  def tweet_id
    favorite_params[:tweet_id]
  end

  def toggle_favorite
    toggle = {
      "false" => lambda { twitter_api.client(current_user).favorite(tweet_id) },
      "true" => lambda { twitter_api.client(current_user).unfavorite(tweet_id) }
    }
    toggle[favorited].call
  end
end
