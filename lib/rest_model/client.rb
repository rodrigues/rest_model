class RestModel
  module Client
    def self.included(base)
      base.extend(ClassMethods)
    end

    def self.default_headers
      {
        "Accept"       => "application/json",
        "Content-Type" => "application/json"
      }
    end

    module ClassMethods
      def host(host = nil)
        return @host || :default unless host

        @host = host
      end

      def get(*attrs)
        base_uri = RestModel::Configuration.hosts[host]
        uri = "#{base_uri}/#{resource_name.pluralize}"

        identifier_present = attrs.first and not attrs.first.kind_of?(Hash)
        uri << "/#{attrs.first}" if identifier_present

        custom_headers = RestModel::Configuration.custom_headers_resolver.call(self)
        headers = RestModel::Client.default_headers.merge(custom_headers)

        source = MultiJson.decode Http.get(uri, headers)

        identifier_present ? from_source(source).first
                           : from_source(source.with_indifferent_access[:entries])
      end
    end
  end
end
