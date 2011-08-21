module Transcriber
  class Resource
    class Href < Key
      include Response::Href

      def initialize
        super(:href)
      end
    end
  end
end
