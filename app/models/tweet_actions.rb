module TweetActions
  module Retweet
    def self.retweet
      twitter_api =  TwitterApi.new
      binding.pry
      # twitter_api.client(self).retweet(retweet_params[:tweet_id])
    end
  end

  module Favorite

  end

  module Unfollow

  end

end
