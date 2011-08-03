module Transcriber
  class Resource
    class Relation < Association
      include Response::Relation

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
end
