module Transcriber
  class Resource
    class Embeddable < Association
      include Parser::Embeddable
      include Response::Embeddable

      def raw?
        ![Hash, Array].include?(resource_class)
      end
    end
  end
end
