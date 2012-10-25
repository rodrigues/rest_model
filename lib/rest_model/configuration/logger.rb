class RestModel
  module Configuration
    module Logger
      def logger
        RestModel::Logger.handler
      end

      def logger=(handler)
        RestModel::Logger.handler = handler
      end
    end
  end
end
