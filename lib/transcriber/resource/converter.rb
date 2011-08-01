class Transcriber::Resource
  module Converter
    def convert_input_keys
      @convert_input_keys || Key::Converter::DefaultHandler
    end

    def convert_input_keys=(converter)
      @convert_input_keys = converter
    end
  end
end
