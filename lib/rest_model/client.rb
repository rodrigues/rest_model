class RestModel
  module Client
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def host(host = nil)
        return @host unless host

        @host = host
      end

      def get(*attrs)
      end
    end
  end
end
