module Transcriber
  class Resource
    module Builder
      module Summarizations
        def summarizes(*args)
          args.each do |name|
            key = keys.find {|key| key.name == name}
            summarized_keys << key if key
          end
        end
      end
    end
  end
end
