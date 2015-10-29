FactoryGirl.define do
  factory :user do
    name "MyString"
    screen_name "MyString"
    uid "MyString"
    oauth_token ENV['twitter_credentials_token']
    oauth_token_secret ENV['twitter_credentials_secret']
    followers_count "27"
    following_count "20"
    tweets_count "402"
  end
end
