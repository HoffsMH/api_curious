require 'rails_helper'

RSpec.feature "UserCanFavoriteATweets", type: :feature, vcr: true do
  context "when logged in" do
    before(:each) do
      stub_omniauth
      visit "/"
      click_link "Login with Twitter"
    end

    it "lets us favorite a tweet" do
      first('form').click_link_or_button('favorite')

      expect(page).to have_button("unfavorite")
    end

    it "lets us unfavorite a tweet" do
      click_link_or_button('unfavorite')

      expect(page).not_to have_button("unfavorite")
    end
  end
end
