class TwitterClient < Twitter::REST::Client
  def initialize
    @consumer_key = ENV['twitter_consumer_key']
    @consumer_secret = ENV['twitter_consumer_secret']
  end
end
