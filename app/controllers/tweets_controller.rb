class TweetsController < ApplicationController

  before_action :verify_user
  def create
    twitter_api.client(current_user).update(tweet_text)
    flash[:notice] = "Posted"
    redirect_to root_path
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text)
  end

  def tweet_text
    tweet_params[:text]
  end

end
