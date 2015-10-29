require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  context "when calling #create without a user in the session" do
    it "redirects to the root path" do

      post :create, poop: { poopy: "poopy" }

      expect(response).to redirect_to root_path
      expect(flash[:notice]).to match("Please Log in first.")
    end
  end
  context "when calling #create with a user in the session but invalid params" do
    it "redirects to root and flashes error", vcr: true do
      user = create(:user)
      long_string = "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
                     wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
                     wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
                     wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww"

      session[:user_id] = user.id
      post :create, tweet: { text: long_string }

      expect(response).to redirect_to root_path
      expect(flash[:notice]).to match("Status is over 140 characters.")
    end
  end

end
