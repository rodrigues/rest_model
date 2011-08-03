module Transcriber
  class Resource
    module Builder
      module Summarization
        def summarize(*args = [])
          args.each do |name|
            key = keys.find {|key| key.name == name}
            key.summarize = true unless key.nil?
          end
        end
      end
    end
  end
end
