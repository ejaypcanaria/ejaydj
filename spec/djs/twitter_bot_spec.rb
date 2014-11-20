require 'spec_helper'

RSpec.describe Ejaydj::Djs::TwitterBot do

  let(:music_client)    { double('MusicClient') }
  let(:twitter_client)  { double('TwitterClient', update: true)}

  let(:twitter_bot_dj) do
    Ejaydj::Djs::TwitterBot.new do |config|
      config.music_user_id        = 'user_1'
      config.music_client_id      = 'client_1'
      config.music_client_secret  = 'client_secret_1'
      config.music_client         = music_client

      config.twitter_consumer_key        = 'consumer_key'
      config.twitter_consumer_secret     = 'consumer_secret'
      config.twitter_access_token        = 'access_token'
      config.twitter_access_token_secret = 'token_secret'
      config.twitter_client              = twitter_client

      config.morning_playlists    = ["Morning Playlist"]
      config.noon_playlists       = ["Noon Playlist"]
      config.night_playlists      = ["Night Playlist"]
      config.late_night_playlists = ["Late Night Playlist"]
    end
  end

  let(:playlist_items) do
    [
      {"name" => "Morning Playlist", "owner" => {"id" => 1}, "external_urls" => {"spotify" => "/playlist_morning"}, "tracks" => {"total" => 10}}
    ]
  end

  let(:track_items) do
    [
      {"track" => { "id"            => 1,
                    "name"          => "Track 1",
                    "album"         => {"name" => "Album 1"},
                    "artists"       => [{"name" => "Artist 1"}]
                   }}
    ]
  end

  before do
    allow(music_client).to receive(:user_playlists).and_return(playlist_items)
    allow(music_client).to receive(:playlist_tracks).and_return(track_items)
  end

  describe '#tweet_me_a_song' do
    it "tweets a song" do
      tweet = twitter_bot_dj.tweet_me_a_song(time: Time.new(2014, 11, 20, 7, 0, 0))
      song = tweet[:song]

      expect(tweet[:message]).to eq("NP: #{song.name} by #{song.artist} from #{song.playlist.name} playlist: #{song.playlist.url}")
    end
  end

end
