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
        source = JSON.parse Http.get(uri)
        from_source(source.with_indifferent_access[:entries])
      end
    end
  end
end
