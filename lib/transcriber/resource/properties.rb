class Transcriber::Resource
  module Properties
    def property(name, options = {})
      attr_accessor name
      keys << Property.new(name, options)
    end
  end
end
