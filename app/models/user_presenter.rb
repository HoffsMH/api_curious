class UserPresenter
  attr_accessor :user
  def initialize(user=nil)
    binding.pry
    @user = user
  end

  def profile_picture
    @user.profile_image_url
  end

  def twitter_client(access_token=nil, access_token_secret=nil)
    @twitter_client                   ||= TwitterClient.new
    @twitter_client.access_token        = access_token        || @user.oauth_token
    @twitter_client.access_token_secret = access_token_secret || @user.oauth_token_secret
    @twitter_client
  end
end

