require 'simplecov'
SimpleCov.start 'rails'
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
    provider: 'twitter',
    extra: {
      raw_info: {
        user_id: "1234",
        name: "Horace",
        screen_name: "worace",
      }
    },
    credentials: {
      token: "pizza",
      secret: "secretpizza"
    },
    info: {
      image: "image_url"
    }
  })
end
