module Ejaydj
  class Track
    attr_reader   :name,
                  :album,
                  :artist,
                  :duration_ms

    attr_accessor :playlist

    def initialize(attributes={})
      @id            = attributes[:id]
      @name          = attributes[:name]
      @album         = attributes[:album]
      @artist        = attributes[:artist]
      @playlist      = attributes[:playlist]
      @duration_ms   = attributes[:duration_ms]
    end
  end
end
