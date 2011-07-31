class Transcriber::Resource::Key
  module Converter
    DefaultHandler = lambda {|keys| keys.map(&:to_s)}

    c_attr_writer :convert_input_keys
    attr_writer   :convert_input_keys

    def convert_input_keys
      @convert_input_keys ||= (options.fetch(:convert_input_keys)       ||
                               self.class.convert_input_keys            ||
                               Transcriber::Resource.convert_input_keys ||
                               DefaultHandler)
    end
  end
end
