module Ejaydj
  module Services
    class Playlist

      def initialize(attributes={})
        @client = attributes[:client]
        @parser = attributes[:parser]
      end

      def all_from(user_id)
        @parser.parse_playlist(
          @client.user_playlists(user_id))
      end
    end
  end
end
