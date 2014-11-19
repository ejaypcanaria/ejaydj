require 'ejaydj/services/playlist_service'
require 'ejaydj/spotify/client'

module Ejaydj
  class Dj
    attr_accessor :music_client_id,
                  :music_client_secret,
                  :music_user_id,
                  :music_client

    def initialize(attributes={})
      instantiate_variables_from attributes
      yield self if block_given?
    end

    def playlists
      @playlists ||= all_playlists
    end

    def reload!
      @playlists = all_playlists
      @playlists.each {|playlist| playlist.reload! }
    end

    private

    def all_playlists
      playlist_service.all_from(@music_user_id)
    end

    def playlist_service
      @playlist_service ||= Services::PlaylistService.new(music_client: music_client)
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
