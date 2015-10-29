class UserPresenter
  attr_accessor :user, :twitter_api

  def initialize(user=User)
    @user = user
    @twitter_api = TwitterApi.new
  end

  def profile_picture
    @user.profile_image_url


  end

  def feed(twitter_api=@twitter_api)
    begin
      @feed ||= twitter_api.client(@user).home_timeline
    rescue => e
      nil
    end
  end
  def favorites
    @favorites ||= twitter_api.client(@user).favorites
  end

  def favorited?(tweet)
    favorites.include?(tweet)
  end
end
