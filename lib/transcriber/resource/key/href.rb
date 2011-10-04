module Transcriber
  class Resource
    class Href < Key
      autoload :Response, "transcriber/resource/key/href/response"
      include Response

      def initialize
        super(:href)
      end
    end
  end
end
