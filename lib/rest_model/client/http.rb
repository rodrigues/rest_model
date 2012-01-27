class RestModel
  module Client
    module Http
      extend self

      def get(uri, headers = {})
        RestClient.get(uri, headers)
      end
    end
  end
end
