class WelcomeController < ApplicationController
  def index
    @user_presenter = UserPresenter.new(current_user)
    render landing_page[current_user?]
  end

  private
  def landing_page
    {
      false =>  '/welcome/index_not_logged_in',
      true =>  '/welcome/index',
    }
  end
end
