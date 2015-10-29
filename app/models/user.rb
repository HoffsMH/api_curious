class User < ActiveRecord::Base
  def self.from_omniauth(auth_info)
    user = User.find_or_create_by( uid: auth_info.uid)

    user.name               = auth_info.extra.raw_info.name
    user.uid                = auth_info.uid
    user.screen_name        = auth_info.extra.raw_info.screen_name
    user.profile_image_url  = auth_info.info.image
    user.oauth_token        = auth_info.credentials.token
    user.oauth_token_secret = auth_info.credentials.secret
    user.followers_count    = auth_info.extra.raw_info.followers_count
    user.following_count    = auth_info.extra.raw_info.friends_count
    user.tweets_count       = auth_info.extra.raw_info.statuses_count
    user.save


    user
  end

  def self.oauth_token
    nil
  end

  def self.oauth_token_secret
    nil
  end
end
