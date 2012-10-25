class RestModel
  module Configuration
    extend self
    extend Keys
    extend Logger
    extend Client

    attr_accessor :host

    DefaultHandler = proc {|keys| keys}

    def configure
      yield self if block_given?
    end
  end
end
