require 'rails_helper'

RSpec.describe UserPresenter, type: :model do
  context "when calling the twitter_client method" do
     it 'if there is no user, returns client with no user data' do
       user_presenter = UserPresenter.new()
       expect(user_presenter.twitter_client).not_to be_nil
       expect(user_presenter.twitter_client.access_token).to be_nil
       expect(user_presenter.twitter_client.access_token_secret).to be_nil
     end

     it 'if there is a user, returns client with the current users data' do
       user = create(:user)
       user_presenter = UserPresenter.new(user)
       expect(user_presenter.twitter_client).not_to be_nil
       expect(user_presenter.twitter_client.access_token).to eq(user.oauth_token)
       expect(user_presenter.twitter_client.access_token_secret).to eq(user.oauth_token_secret)
     end
  end
end
