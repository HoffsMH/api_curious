require 'rails_helper'

RSpec.feature "UserCanViewFeeds", type: :feature, vcr: true do
  context "when logged in" do
    it "shows our feed" do
      stub_omniauth
      visit "/"

      expect(page.status_code).to eq(200)
      click_link "Login with Twitter"
      expect(page).to have_content("DeMarcus Cousins has made 4 3-pointers tonight.")
    end
  end
end
