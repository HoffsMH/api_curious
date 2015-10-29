require 'rails_helper'

RSpec.feature "UserCanSeeProfileInformations", type: :feature, vcr: true do
  context "when logged in" do
    it "shows our profile information" do
      stub_omniauth
      visit "/"

      expect(page.status_code).to eq(200)
      click_link "Login with Twitter"
      expect(page).to have_content("Tweets: 22 ")
      expect(page).to have_content("Following: 22 ")
      expect(page).to have_content("Tweets: 22 ")
    end
  end
end
