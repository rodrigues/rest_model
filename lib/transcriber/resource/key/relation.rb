module Transcriber
  class Resource
    class Relation < Association
      autoload :Response, "transcriber/resource/key/relation/response"
      include Response

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

      def parse(value, resource = nil)
        nil
      end
    end
  end
end
