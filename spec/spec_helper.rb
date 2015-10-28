require "factory_girl_rails"
require 'omniauth'
require 'capybara/rspec'
require 'webmock/rspec'
require 'simplecov'

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
