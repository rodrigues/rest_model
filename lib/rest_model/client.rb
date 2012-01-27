class RestModel
  module Client
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def host(host = nil)
        return @host || :default unless host

        @host = host
      end

      def get(*attrs)
        base_uri = RestModel::Configuration.hosts[host]
        uri = "#{base_uri}/#{resource_name.pluralize}"
        source = MultiJson.decode(Http.get(uri), symbolize_keys: true)
        from_source(source[:entries])
      end
    end
  end
end
