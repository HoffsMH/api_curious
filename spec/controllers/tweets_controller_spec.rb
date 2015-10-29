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
    it "redirects to root and flashes error" do
      user = create(:user)

      session[:user_id] = user.id
      post :create, poop: { poopy: "poopy" }

      expect(response).to redirect_to root_path
      expect(flash[:notice]).to match("Please Log in first.")
    end
  end

end
