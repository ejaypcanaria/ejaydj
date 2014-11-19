module Ejaydj
	class Playlist
		attr_reader :id,
                :name,
                :url,
                :number_of_tracks

    def initialize(attributes={})
      @id								= attributes[:id]
      @name 						= attributes[:name]
      @url							= attributes[:url]
      @number_of_tracks = attributes[:number_of_tracks]
    end

  end
end
