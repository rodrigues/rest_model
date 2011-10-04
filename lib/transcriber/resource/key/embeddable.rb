module Transcriber
  class Resource
    class Embeddable < Association
      autoload :Parser,   "transcriber/resource/key/embeddable/parser"
      autoload :Response, "transcriber/resource/key/embeddable/response"
      include Parser
      include Response

      attr_accessor :fields

      def initialize(name, options = {})
        super

        if fields = options[:fields]
          @class_name = :array
          @fields = fields
        end
      end

      def raw?
        [Hash, Array].include?(resource_class)
      end
    end
  end
end
