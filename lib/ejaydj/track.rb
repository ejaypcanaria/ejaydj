require 'ejaydj/mixins'

module Ejaydj
  class Track
    include Mixins

    attr_accessor :name,
                  :album,
                  :artist,
                  :duration_ms,
                  :url,
                  :playlist

    def initialize(attributes={})
      instantiate_variables_from attributes
    end
  end
end
