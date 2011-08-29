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
  end
end
