module Transcriber
  class Configuration
    DefaultHandler = lambda {|keys| keys.map(&:to_s)}

    def convert_input_keys
      @convert_input_keys || DefaultHandler
    end

    def convert_input_keys=(converter)
      @convert_input_keys = converter
    end
  end
end
