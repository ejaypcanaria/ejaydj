module Ejaydj
  module Services
    class TrackService
      def initialize(music_client: nil, user_id: nil, playlist_id: nil)
        @music_client = music_client
        @user_id      = user_id
        @playlist_id  = playlist_id
      end

      def all
        response_items = @music_client.playlist_tracks(user_id: @user_id, playlist_id: @playlist_id)

        response_items.map do |item|
          Track.new(
            id:            item["track"]["id"],
            name:          item["track"]["name"],
            album:         item["track"]["album"]["name"],
            artist:        item["track"]["artists"][0]["name"],
            duration_ms:   item["track"]["duration_ms"],
            url:           item["track"]["external_urls"]["spotify"]
          )
        end
      end
    end
  end
end
