class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    load_session(user)
    redirect_to root_path
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  private
  def load_session(user)
    action      = Hash.new(lambda { session[:user_id] = user.id })
    action[nil] = lambda {nil}
    action[user].call
  end
end
