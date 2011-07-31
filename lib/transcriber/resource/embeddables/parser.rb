class Transcriber::Resource::Embeddable
  module Parser
    def parse(item)
      options = {}
      options.merge!(start_key: start_key) if start_key
      value = class_name.constantize.parse(item, options)
      one? ? value.first : value
    end
  end
end
