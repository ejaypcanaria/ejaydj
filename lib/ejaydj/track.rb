module Ejaydj
  class Track
    attr_reader :name,
                :album,
                :artist

    def initialize(attributes={})
      @id       = attributes[:id]
      @name     = attributes[:name]
      @album    = attributes[:album]
      @artist   = attributes[:artist]
      @playlist = attributes[:playlist]
    end
  end
end
