class User < ActiveRecord::Base
  def self.from_omniauth(auth_info)
    user = User.find_or_create_by( uid: auth_info.uid)

    user.name               = auth_info.extra.raw_info.name
    user.uid                = auth_info.uid
    user.screen_name        = auth_info.extra.raw_info.screen_name
    user.profile_image_url  = auth_info.info.image
    user.location           = auth_info.info.location
    user.website            = auth_info.extra.raw_info.entities.url.urls[0].expanded_url
    user.oauth_token        = auth_info.credentials.token
    user.oauth_token_secret = auth_info.credentials.secret
    user.followers_count    = auth_info.extra.raw_info.followers_count
    user.following_count    = auth_info.extra.raw_info.friends_count
    user.tweets_count       = auth_info.extra.raw_info.statuses_count
    user.save


    user
  end
  def client
    @client ||= TwitterApi.new.client(self)
  end

  def retweet(retweet_params)
    begin
      client.retweet(retweet_params[:tweet_id])
      return "retweeted"
    rescue StandardError => e
      return e.to_s
    end
  end

  def tweet(tweet_params)
    begin
      client.update(tweet_params[:text])
      return "Posted"
    rescue StandardError => e
      return e.to_s
    end
  end

  def toggle_favorite(favorite_params)
    favorited         = favorite_params[:favorited]
    favorite_tweet_id = favorite_params[:tweet_id]
    toggle            = Hash.new(lambda {"Refresh the page and try again"})

    toggle["false"]   = lambda { client.favorite(favorite_tweet_id)
                                "Favorited"}
    toggle["true"]    = lambda { client.unfavorite(favorite_tweet_id)
                                "Unfavorited"}

    begin
      return toggle[favorited].call
    rescue StandardError => e
      return e.to_s
    end
  end

  def unfollow(unfollow_params)
    begin
      client.unfollow(unfollow_params[:user_screen_name])
      return"unfollowed"
    rescue StandardError => e
      return  e.to_s
    end
  end

  def self.oauth_token
    nil
  end

  def self.oauth_token_secret
    nil
  end
end
