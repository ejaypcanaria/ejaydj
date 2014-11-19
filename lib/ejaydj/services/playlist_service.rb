module Ejaydj
  module Services
    class PlaylistService

      def initialize(music_client: nil)
        @music_client = music_client
      end

      def all_from(user_id)
        response_json = @music_client.user_playlists(user_id)

        response_json["items"].map do |playlist|
          Playlist.new(
            id:                 playlist["id"],
            user_id:            playlist["owner"]["id"],
            name:               playlist["name"],
            url:                playlist["external_urls"]["spotify"],
            number_of_tracks:   playlist["tracks"]["total"],

            music_client:       @music_client)
        end
      end
    end
  end
end
