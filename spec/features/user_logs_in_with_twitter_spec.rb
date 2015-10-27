require "rails_helper"

RSpec.feature "user loggs in with twitter" do
  context "when not logged in" do
    scenario "can login" do
      stub_omniauth
      visit '/'
      expect(page.status_code).to eq(200)
      click_link "Login with Twitter"
      expect(page).to have_content("worace")
    end
  end
end
