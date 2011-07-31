class Transcriber::Resource
  class Embeddable < Key
    autoload :Parser,   'transcriber/resource/embeddable/parser'
    autoload :Resource, 'transcriber/resource/embeddable/resource'
    include   Parser
    include   Resource

    attr_accessor :name
    attr_accessor :many

    def initialize(name, options = {})
      @name = name
      @many = options.fetch(:many, false)
    end

    def one?
      !@many
    end

    def many?
      @many
    end
  end
end
