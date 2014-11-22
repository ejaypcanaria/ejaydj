module Ejaydj
  class Track
    attr_accessor :name,
                  :album,
                  :artist,
                  :duration_ms,
                  :url,
                  :playlist

    def initialize(attributes={})
      @id            = attributes[:id]
      @name          = attributes[:name]
      @album         = attributes[:album]
      @artist        = attributes[:artist]
      @playlist      = attributes[:playlist]
      @duration_ms   = attributes[:duration_ms]
      @url           = attributes[:url]
    end
  end
end
