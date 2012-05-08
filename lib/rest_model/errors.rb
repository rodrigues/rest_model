class RestModel
  class SerializationError < StandardError; end
  class TranslationError   < StandardError; end

  class SourceError < StandardError
    attr_reader :errors

    def initialize(errors)
      @errors = errors
    end

    def message
      @errors
    end

    def self.exception(errors = {})
      new(errors)
    end
  end
end
