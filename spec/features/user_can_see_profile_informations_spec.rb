require 'rails_helper'

RSpec.feature "UserCanSeeProfileInformations", type: :feature, vcr: true do
  context "when logged in" do
    it "shows our profile information" do
      user = create(:user)
      stub_omniauth
      visit "/"

      expect(page.status_code).to eq(200)
      click_link "Login with Twitter"
      expect(page).to have_content("Tweets: #{user.tweets_count}")
      expect(page).to have_content("Following: #{user.following_count}")
      expect(page).to have_content("Followers: #{user.followers_count}")
    end
  end
end
