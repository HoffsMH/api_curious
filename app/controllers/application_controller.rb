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

  def verify_user
    user_path[current_user?].call
  end

  def user_path
    {
      true  => lambda {nil},
      false => lambda {redirect_to root_path}
    }
  end

  def twitter_api
    TwitterApi.new
  end

end
