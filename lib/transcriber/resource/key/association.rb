class Transcriber::Resource
  class Association < Relation
    autoload :Resource, 'transcriber/resource/key/association/resource'
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
