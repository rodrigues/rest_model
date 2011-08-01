class Transcriber::Resource::Key
  module Converter
    DefaultHandler = lambda {|keys| keys.map(&:to_s)}

    attr_writer :convert_input_keys

    def convert_input_keys
      options[:convert_input_keys] or Transcriber::Resource.convert_input_keys
    end
  end
end
