class Transcriber::Resource
  class Property
    autoload :Parser, 'transcriber/resource/properties/parser'
    include   Parser

    attr_accessor :name
    attr_accessor :field
    attr_accessor :values
    attr_accessor :options

    def initialize(name, options = {})
      @name  = name
      @field = prepare_field(options.delete(:field) || name)

      @serializer = (options.delete(:type)  || Serialization::String)
      @values     =  options.delete(:values)
      @options    =  options
    end

    def prepare_field(field)
      field.to_s.upcase # @TODO this logic shouldn't be here.
                        # it's a key conversion strategy
                        # convert(field).to_s, convert should be
                        # an identity function if a custom
                        # strategy was not set.
    end
  end
end
