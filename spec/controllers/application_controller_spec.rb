require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  context "when calling the current_user method" do
     it 'if there is no user, retuns the class User' do
       expect(@controller.current_user).to eq(User)
     end

     it 'if there is a user, returns the current user' do
       user = create(:user)
       session[:user_id] = 1
       expect(@controller.current_user).to eq(User)
     end
  end
end




