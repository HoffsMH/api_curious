require 'rails_helper'

RSpec.describe Twitter, type: :model, vcr: true do
  context "when not given a user" do
    let!(:twitter) {TwitterApi.new.client()}
    it "returns a twitter client with no user credentials" do
      expect(twitter).not_to be_nil
      expect(twitter.access_token).to be_nil
      expect(twitter.access_token_secret).to be_nil
    end
  end
  context "when given a user" do
    let(:user) {create(:user)}
    let!(:twitter) {TwitterApi.new.client(user)}
    it "returns a twitter client with user credentials" do
      expect(twitter).not_to be_nil
      expect(twitter.access_token).not_to be_nil
      expect(twitter.access_token_secret).not_to be_nil
    end
  end
end
