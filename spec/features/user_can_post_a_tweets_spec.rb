require 'rails_helper'

RSpec.feature "UserCanPostATweets", type: :feature, vcr: true do
  context "when logged in" do
    it "lets us post a tweet" do
      stub_omniauth
      visit "/"

      click_link "Login with Twitter"
      fill_in "tweet[text]" , with: "This post will never be tweeted"
      click_link_or_button "Post"
      expect(page).to have_content("Posted")
    end
  end
end
