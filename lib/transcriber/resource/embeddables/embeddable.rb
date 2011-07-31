class Transcriber::Resource
  class Embeddable
    autoload :Parser, 'transcriber/resource/embeddables/parser'
    include   Parser

    attr_accessor :name
    attr_accessor :class_name
    attr_accessor :start_key
    attr_accessor :many
    attr_accessor :options

    def initialize(name, options = {})
      @name = name

      @class_name = (options.delete(:class_name) || name).to_s.camelize
      @start_key  =  options.delete(:start_key)
      @many       =  options.delete(:many)
      @options    =  options
    end

    def one?
      !@many
    end

    def many?
      @many
    end
  end
end
