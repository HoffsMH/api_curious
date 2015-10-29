require 'rails_helper'

RSpec.describe User, type: :model, vcr: true do
  context "toggle_favorites" do
    it "when given invalid params, fails, then returns an error message" do
      user           = create(:user)
      invalid_params = {
                         favorited: "asdf",
                         tweet_id:  "abc"
                       }

      message = user.toggle_favorite(invalid_params)
      expect(message).to eq("Refresh the page and try again")

      invalid_params = {
                         favorited: "true",
                         tweet_id:  "abc"
                       }

      message = user.toggle_favorite(invalid_params)
      expect(message).to eq("No status found with that ID.")
    end
  end

  context "unfollow" do
    it "when given invalid params, fails, then returns an error message" do
      user           = create(:user)
      invalid_params = {
                         user_screen_name: "*@912*"
                       }

      message = user.unfollow(invalid_params)
      expect(message).to eq("Sorry, that page does not exist.")

      invalid_params = {
                         user_screen_name: "MongoDB"
                       }

      message = user.unfollow(invalid_params)
      expect(message).to eq("No status found with that ID.")
    end
  end

end
