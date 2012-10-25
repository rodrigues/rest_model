class RestModel
  module Client
    module Http
      extend self

      VERBS = %w(get post put patch delete)

      VERBS.each do |verb|
        define_method verb do |uri, options = {}|
          headers = options[:headers]
          body    = options[:body] || {}

          http = Curl.send verb, uri, body do |c|
            c.headers = headers if headers
          end

          http.body_str
        end
      end
    end
  end
end
