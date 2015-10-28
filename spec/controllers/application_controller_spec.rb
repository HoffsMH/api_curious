require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  context "when calling the current_user method" do
     it 'if there is no user, retuns the class User' do
       expect(@controller.current_user).to eq(User)
     end

     it 'if there is a user, returns the current user' do
       user = create(:user)
       session[:user_id] = user.id
       expect(@controller.current_user).to eq(user)
     end
  end

  context "when calling the twitter_client method" do
     it 'if there is no user, returns client with no user data' do
       expect(@controller.twitter_client.access_token).to be_nil
       expect(@controller.twitter_client.access_token_secret).to be_nil
     end

     it 'if there is a user, returns client with the current users data' do
       user = create(:user)
       session[:user_id] = user.id
       expect(@controller.twitter_client.access_token).to eq(user.oauth_token)
       expect(@controller.twitter_client.access_token_secret).to eq(user.oauth_token_secret)
     end
  end
end




