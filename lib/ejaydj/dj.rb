require 'ejaydj/services/playlist_service'
require 'ejaydj/spotify/client'

module Ejaydj
  class Dj
    PLAYLIST_SCHEDULE = {
      6..11   => :morning_playlists,      # 6AM  - 12PM
      12..17  => :noon_playlists,         # 12PM - 6PM
      18..22  => :night_playlists,        # 6PM  - 11PM
      23..23  => :late_night_playlists,   # 11PM - 6AM
      0..5    => :late_night_playlists
    }

    attr_accessor :music_client_id,
                  :music_client_secret,
                  :music_user_id,
                  :music_client,
                  :morning_playlists,
                  :noon_playlists,
                  :night_playlists,
                  :late_night_playlists


    def initialize(attributes={})
      instantiate_variables_from attributes
      yield self if block_given?
    end

    def play_me_a_song(time: Time.now)
      current_playlist(time).next_track
    end

    def playlists
      @playlists ||= all_playlists
    end

    def reload!
      @playlists = all_playlists
      @playlists.each {|playlist| playlist.reload!}
    end

    private

    def current_playlist(time)
      playlist_name = scheduled_playlist(time.strftime('%k').to_i)
      playlist = playlists.select do |playlist|
        playlist.name == playlist_name
      end.first
    end

    def scheduled_playlist(time)
      scheduled_playlists = PLAYLIST_SCHEDULE.select do |schedule, value|
        schedule.cover? time
      end.values.first

      send(scheduled_playlists).sample
    end

    def all_playlists
      playlist_service.all
    end

    def playlist_service
      @playlist_service ||= Services::PlaylistService.new(
                                music_client: music_client,
                                user_id: music_user_id)
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
