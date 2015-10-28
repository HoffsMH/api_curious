FactoryGirl.define do
  factory :user do
    name "MyString"
    screen_name "MyString"
    uid "MyString"
    oauth_token ENV['twitter_credentials_token']
    oauth_token_secret ENV['twitter_credentials_secret']
  end
end
