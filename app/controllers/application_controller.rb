class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user = User.find_by(id: session[:user_id]) || User
  end

  def current_user?
    current_user.is_a? User
  end

  def twitter_client(access_token=nil, access_token_secret=nil)
    @twitter_client                   ||= TwitterClient.new
    @twitter_client.access_token        = access_token        || current_user.oauth_token
    @twitter_client.access_token_secret = access_token_secret || current_user.oauth_token_secret
    @twitter_client
  end
end
