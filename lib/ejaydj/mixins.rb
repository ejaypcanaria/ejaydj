module Ejaydj
  module Mixins

    protected

    def instantiate_variables_from(attributes)
      attributes.each {|key, val| instance_variable_set(:"@#{key}", val) }
    end
  end
end
