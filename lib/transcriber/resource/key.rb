class Transcriber::Resource
  class Key
    autoload :Converter, 'transcriber/resource/key/converter'
    autoload :InputPath, 'transcriber/resource/key/input_path'
    include   Converter
    include   InputPath

    attr_accessor :name
    attr_accessor :options

    def initialize(name, options = {})
      @name    = name
      @options = options
    end

    def present?(resource)
      return true unless options[:if]
      resource.instance_eval &options[:if]
    end
  end
end
