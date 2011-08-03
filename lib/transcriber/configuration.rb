module Transcriber
  class Configuration
    def convert_input_keys
      @convert_input_keys || Transcriber::Resource::Key::Converter::DefaultHandler
    end

    def convert_input_keys=(converter)
      @convert_input_keys = converter
    end
  end
end
