module Ejaydj
  module Services
    class TrackService
      def initialize(music_client: nil, user_id: nil, playlist_id: nil)
        @music_client = music_client
        @user_id      = user_id
        @playlist_id  = playlist_id
      end

      def all
        response_json = @music_client.playlist_tracks(@user_id, @playlist_id)

        response_json["items"].map do |track|
          Track.new(
            id:     track["track"]["id"],
            name:   track["track"]["name"],
            album:  track["track"]["album"]["name"],
            artist: track["track"]["artists"][0]["name"]
          )
        end
      end
    end
  end
end
