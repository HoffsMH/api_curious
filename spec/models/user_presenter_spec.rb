require 'rails_helper'

RSpec.describe UserPresenter, type: :model, vcr: true do
  context "when calling the feed method" do
     it 'if there is no user, returns nill' do
       user_presenter = UserPresenter.new()
       expect(user_presenter.feed).to eq(nil)
     end

     it 'if there is a user, returns client with the current users data' do
       user = create(:user)
       user_presenter = UserPresenter.new(user)
       expect(user_presenter.feed).not_to be_nil
     end
  end
end
