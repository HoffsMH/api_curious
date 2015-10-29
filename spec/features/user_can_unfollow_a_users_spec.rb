require 'rails_helper'

RSpec.feature "UserCanUnfollowAUsers", type: :feature, vcr: true do
  context "when logged in" do
    before(:each) do
      stub_omniauth
      visit "/"
      click_link "Login with Twitter"
    end

    it "lets us unfollow  a user" do
      expect(page).to have_content("LustboyLoL")
      first(".tweet-outer").click_link_or_button('unfollow')

      expect(page).to have_content("unfollowed")
      expect(page).not_to have_content("LustboyLoL")
    end
  end
end
