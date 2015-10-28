class UserPresenter
  attr_accessor :user

  def initialize(user=User)
    @user = user
    @twitter_api = TwitterApi.new
  end

  def profile_picture
    @user.profile_image_url


  end

  def feed(twitter_api=@twitter_api)
    begin
      twitter_api.client(@user).home_timeline
    rescue => e
      nil
    end
  end
end
