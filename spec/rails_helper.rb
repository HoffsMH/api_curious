# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data('<TWITTER_CONSUMER_KEY>') { ENV['twitter_consumer_key'] }
  config.filter_sensitive_data('<TWITTER_CONSUMER_SECRET>') { ENV['twitter_consumer_secret'] }
  config.filter_sensitive_data('<CREDENTIALS_TOKEN>') { ENV['twitter_credentials_token'] }
  config.filter_sensitive_data('<CREDENTIALS_SECRET>') { ENV['twitter_credentials_secret'] }
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!
end
