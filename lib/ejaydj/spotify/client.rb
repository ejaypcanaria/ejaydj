require 'rest_client'
require 'base64'
require 'json'

module Ejaydj
	module Spotify
		class Client

			API_URL 					= 'https://api.spotify.com'
			ACCOUNT_API_URL		= 'https://accounts.spotify.com'

			def initialize(config={})
        config.merge!(default_config)

        @rest_client   = config[:rest_client]
        @client_id 		 = config[:client_id]
        @client_secret = config[:client_secret]
      end

      def user_playlists(user_id)
        url = "#{API_URL}/v1/users/#{user_id}/playlists"
        get_request(url)
      end

      private

      def get_request(url)
        JSON.parse(@rest_client.get(url, headers))
      end

      def headers
        {"Authorization" => "Bearer #{get_access_token}"}
      end

      def get_access_token
        encoded_client_id_secret = Base64.strict_encode64("#{@client_id}:#{@client_secret}")
        payload = {grant_type: 'client_credentials'}
        headers = {"Authorization" => "Basic #{encoded_client_id_secret}"}

        response = @rest_client.post("#{ACCOUNT_API_URL}/api/token", payload, headers)

        return JSON.parse(response)["access_token"]
      end

      def default_config
        { rest_client: RestClient }
      end

    end
  end
end
