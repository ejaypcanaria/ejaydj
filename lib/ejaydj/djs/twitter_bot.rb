require 'twitter'

module Ejaydj
  module Djs
    class TwitterBot < Ejaydj::Dj
      attr_accessor :tweeter_consumer_key,
                    :tweeter_consumer_secret,
                    :tweeter_access_token,
                    :tweeter_access_token_secret,
                    :tweeter_client

      def initialize(attributes={}, &block)
        super(attributes, &block)
      end

      def tweet_me_a_song
        song = play_me_a_song
        tweet = "NP: #{song.name} by #{song.artist} from #{song.playlist.name} playlist: #{song.playlist.url}"
        twitter_client.update(tweet)
        tweet
      end

      private

      def twitter_client
        @twitter_client ||= Twitter::REST::Client.new do |config|
          config.consumer_key        = @tweeter_consumer_key
          config.consumer_secret     = @tweeter_consumer_secret
          config.access_token        = @tweeter_access_token
          config.access_token_secret = @tweeter_access_token_secret
        end
      end
    end
  end
end
