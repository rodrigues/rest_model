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

        identifier_present = attrs.first and not attrs.first.kind_of?(Hash)
        uri << "/#{attrs.first}" if identifier_present

        source = MultiJson.decode Http.get(uri)

        identifier_present ? from_source(source).first
                           : from_source(source.with_indifferent_access[:entries])
      end
    end
  end
end
