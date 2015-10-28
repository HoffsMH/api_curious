require 'rails_helper'

RSpec.feature "UserCanViewFeeds", type: :feature do
  context "when logged in" do
    it "shows our feed" do
      stub_omniauth
      visit "/"
    end
  end
end
