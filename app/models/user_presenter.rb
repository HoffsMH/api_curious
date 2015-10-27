class UserPresenter
  attr_accessor :user
  def initialize(user=nil)
    @user = user
  end

  def profile_picture
    @user.profile_image_url
  end
end

