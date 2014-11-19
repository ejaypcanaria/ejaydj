module Ejaydj
  module Parsers
    class Spotify
      class << self

        def parse_playlist(response_json)
          response_json["items"].map do |playlist|
            Playlist.new(
              id:                 playlist["id"],
              name:               playlist["name"],
              url:                playlist["external_urls"]["spotify"],
              number_of_tracks:   playlist["tracks"]["total"])
          end
        end

      end
    end
  end
end
