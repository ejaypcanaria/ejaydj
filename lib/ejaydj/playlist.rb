require 'ejaydj/services/track_service'
require 'ejaydj/mixins'

module Ejaydj
  class Playlist
    include Mixins

    attr_accessor :id,
                  :user_id,
                  :name,
                  :url,
                  :number_of_tracks

    def initialize(attributes={})
      instantiate_variables_from attributes
    end

    def next_track
      reload! if tracks.empty?
      track = tracks.pop
      track.playlist = self
      track
    end

    def tracks
      @tracks ||= all_tracks
    end

    def reload!
      @tracks = all_tracks
    end

    private

    def all_tracks
      track_service.all.shuffle
    end

    def track_service
      @track_service ||= Services::TrackService.new(
                                          music_client: @music_client,
                                          user_id: @user_id,
                                          playlist_id: @id)
    end
  end
end
