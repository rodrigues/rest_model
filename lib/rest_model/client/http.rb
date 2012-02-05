class RestModel
  module Client
    module Http
      extend self

      def get(uri, headers = {})
        Logger.info("about to get #{uri} with headers #{headers}")
        RestClient.get(uri, headers).tap do |response|
          Logger.info("got response #{response}")
        end
      rescue => e
        Logger.error("got error while trying to get #{uri}: \n#{e.response}")
        raise
      end
    end
  end
end
