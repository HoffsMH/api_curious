class TweetsController < ApplicationController
  def create
    flash[:notice] = "Posted"
    redirect_to root_path
  end
end
