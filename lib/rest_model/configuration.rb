class RestModel
  module Configuration
    extend self

    attr_accessor :host

    DefaultHandler = proc {|keys| keys}

    def configure
      yield self
    end

    def convert_input_keys
      @convert_input_keys || DefaultHandler
    end

    def convert_input_keys=(converter)
      @convert_input_keys = converter
    end

    def custom_headers_resolver
      @custom_headers_resolver || proc {{}}
    end

    def custom_headers_resolver=(custom_headers_resolver)
      @custom_headers_resolver = custom_headers_resolver
    end

    def logger
      Logger.handler
    end

    def logger=(handler)
      Logger.handler = handler
    end

    def true_value
      @true || true
    end

    def true_value=(value)
      @true = value
    end

    def false_value
      @false || false
    end

    def false_value=(value)
      @false = value
    end

    def date_format
      @date_format
    end

    def date_format=(format)
      @date_format = format
    end

    def date_time_format
      @date_time_format
    end

    def date_time_format=(format)
      @date_time_format = format
    end

    def hosts
      (@hosts || {}).merge({default: host})
    end

    def hosts=(hosts)
      @hosts = hosts
    end
  end
end
