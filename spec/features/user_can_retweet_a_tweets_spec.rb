require 'rails_helper'

RSpec.feature "UserCanRetweetATweets", type: :feature, vcr: true do
  context "when logged in" do
    before(:each) do
      stub_omniauth
      visit "/"
      click_link "Login with Twitter"
    end

    it "lets us retweet a tweet" do
      first(".tweet-outer").click_link_or_button('retweet')

      expect(page).to have_content("retweeted")
    end

    it "wont let us retweet twice" do
      first(".tweet-outer").click_link_or_button('retweet')
      first(".tweet-outer").click_link_or_button('retweet')

      expect(page).to have_content("You have already retweeted this tweet.")
    end
  end
end
