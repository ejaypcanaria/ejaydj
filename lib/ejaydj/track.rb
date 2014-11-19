module Ejaydj
  class Track
    attr_reader   :name,
                  :album,
                  :artist

    attr_accessor :playlist_name

    def initialize(attributes={})
      @id            = attributes[:id]
      @name          = attributes[:name]
      @album         = attributes[:album]
      @artist        = attributes[:artist]
      @playlist_name = attributes[:playlist_name]
    end
  end
end
