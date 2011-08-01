class Transcriber::Resource
  module Properties
    def property(name, options = {})
      attr_accessor name
      keys << Property.new(name, options)
    end
    
    def properties(*names)
      options = {}
      options = names.pop if names.last.kind_of? Hash
      names.each { |name| property(name, options) }
    end
  end
end