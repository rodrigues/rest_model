class Transcriber::Resource
  class Relation < Association
    autoload :Resource, 'transcriber/resource/key/relation/resource'
    include   Resource

    def initialize(name, options = {})
      super
      @has = options.fetch(:has, false)
    end

    def has?
      @has
    end

    def belongs?
      !has?
    end

    def parse(value)
      nil
    end
  end
end
