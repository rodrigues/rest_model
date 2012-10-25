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

      RestModel::Client::Http::VERBS.each do |verb|
        define_method verb do |*attrs|
          response = Http.send(verb, extract_uri(*attrs), :headers => extract_headers(*attrs))
          decode(response, *attrs)
        end
      end

      private

      def extract_uri(*attrs)
        base_uri = RestModel::Configuration.hosts[host]
        uri = "#{base_uri}/#{resource_name.pluralize}"
        uri << "/#{attrs.first}" if identifier_present?(*attrs)
        uri
      end

      def extract_headers(*attrs)
        custom_headers = RestModel::Configuration.headers_resolver.call(self)
        RestModel::Client.default_headers.merge(custom_headers)
      end

      def decode(response, *attrs)
        source = MultiJson.decode(response)

        if identifier_present?(*attrs)
          from_source(source).first
        else
          from_source(source.with_indifferent_access[:entries]) # <== THIS
        end
      end

      def identifier_present?(*attrs)
        attrs.first && !attrs.first.kind_of?(Hash)
      end
    end
  end
end
