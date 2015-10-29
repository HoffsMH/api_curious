require "rails_helper"

RSpec.feature "user loggs in with twitter", vcr: true do
  context "when not logged in" do

    scenario "can login" do
      user = create(:user)
      stub_omniauth
      visit '/'
      expect(page.status_code).to eq(200)

      click_link "Login with Twitter"
      expect(page).to have_content(user.screen_name)
    end
  end

  context "when  logged in" do
    before(:each) do
      stub_omniauth
      visit '/'
      click_link "Login with Twitter"
    end

    scenario "can login"  do
      click_link "Log out"
      expect(page).to have_content("Login with Twitter")
    end
  end
end
