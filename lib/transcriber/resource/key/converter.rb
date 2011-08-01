class Transcriber::Resource::Key
  module Converter
    extend ActiveSupport::Concern

    DefaultHandler = lambda {|keys| keys.map(&:to_s)}

    attr_writer   :convert_input_keys

    def convert_input_keys
      @convert_input_keys or options[:convert_input_keys] or self.class.convert_input_keys
    end

    module ClassMethods
      def convert_input_keys
        @convert_input_keys or Transcriber::Resource.convert_input_keys
      end

      def convert_input_keys=(&block)
        @convert_input_keys = block
      end
    end
  end
end
