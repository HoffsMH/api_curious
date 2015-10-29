require "factory_girl_rails"
require 'omniauth'
require 'capybara/rspec'
require 'webmock/rspec'
require 'simplecov'
require 'vcr'
require 'pry'

SimpleCov.start 'rails'


RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.include Capybara::DSL

  config.include FactoryGirl::Syntax::Methods


  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
def stub_omniauth
  user = create(:user)
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
    uid: user.uid,
    provider: 'twitter',
    credentials: {
      token: user.oauth_token,
      secret: user.oauth_token_secret
    },
    info: {
      image: user.profile_image_url
    },
    extra: {
      raw_info: {
        followers_count: user.followers_count,
        friends_count:  user.following_count,
        statuses_count: user.tweets_count,
        name: "Horace",
        screen_name: user.screen_name
      }
    }

  })
end
