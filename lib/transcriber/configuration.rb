module Transcriber
  class Configuration
    attr_accessor :host

    DefaultHandler = lambda {|keys| keys}

    def convert_input_keys
      @convert_input_keys || DefaultHandler
    end

    def convert_input_keys=(converter)
      @convert_input_keys = converter
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
  end
end
