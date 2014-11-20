require 'twitter'

module Ejaydj
  module Djs
    class TwitterBot < Ejaydj::Dj
      attr_accessor :twitter_consumer_key,
                    :twitter_consumer_secret,
                    :twitter_access_token,
                    :twitter_access_token_secret,
                    :twitter_client

      def initialize(attributes={}, &block)
        super(attributes, &block)
      end

      def tweet_me_a_song(time: Time.now)
        song = play_me_a_song(time: time)
        tweet = "NP: #{song.name} by #{song.artist} from #{song.playlist.name} playlist: #{song.playlist.url}"
        twitter_client.update(tweet)

        {message: tweet, song: song}
      end

      private

      def twitter_client
        @twitter_client ||= Twitter::REST::Client.new do |config|
          config.consumer_key        = @twitter_consumer_key
          config.consumer_secret     = @twitter_consumer_secret
          config.access_token        = @twitter_access_token
          config.access_token_secret = @twitter_access_token_secret
        end
      end
    end
  end
end
