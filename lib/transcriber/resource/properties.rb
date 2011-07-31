class Transcriber::Resource
  module Properties
    autoload :Property, 'transcriber/resource/properties/property'

    def property(name, options = {})
      attr_accessor name
      keys << Property.new(name, options)
    end
  end
end
