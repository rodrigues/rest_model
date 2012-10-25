class RestModel
  module Configuration
    module Client
      def headers_resolver
        @headers_resolver || proc {{}}
      end

      def headers_resolver=(headers_resolver)
        @headers_resolver = headers_resolver
      end

      def host
        @host
      end

      def host=(host)
        @host = host
      end

      def hosts
        (@hosts || {}).tap do |h|
          h.merge!(default: host) if host
        end
      end

      def hosts=(hosts)
        @hosts = hosts
      end
    end
  end
end
