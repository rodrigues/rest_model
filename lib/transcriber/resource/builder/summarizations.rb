module Transcriber
  class Resource
    module Builder
      module Summarization
        def summarizes(*args = [])
          args.each do |name|
            key = keys.find {|key| key.name == name}
            key.summarize = true if key
          end
        end
      end
    end
  end
end
