require 'ejaydj/parsers/spotify'
require 'ejaydj/services/playlist'
require 'ejaydj/spotify/client'

module Ejaydj
  class Dj
    attr_accessor :music_client_id,
                  :music_client_secret,
                  :music_user_id,
                  :music_client,
                  :music_parser

    def initialize(attributes={})
      attributes.merge!(default_attributes)
      instantiate_variables_from attributes
    end

    def playlists
      @playlists ||= playlist_service.all_from(music_user_id)
    end

    def reload
      @playlists = playlist_service.all_from(music_user_id)
    end

    private

    def playlist_service
      @playlist_service ||= Services::Playlist.new(
                                        client: music_client,
                                        parser: music_parser)
    end

    def default_attributes
      {
        music_parser: Parsers::Spotify
      }
    end

    def music_client
      @music_client ||= Spotify::Client.new(
                          client_id: music_client_id,
                          client_secret: music_client_secret)
    end

    def instantiate_variables_from(attributes)
      attributes.each {|key, val| instance_variable_set(:"@#{key}", val) }
    end
  end
end
