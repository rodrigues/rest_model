module Transcriber
  class Resource
    module Source
      module Retriever
        def from_source!(input, options = {})
          from_source(input, options.merge(fail: true))
        end

        def from_source(input, options = {})
          entries = prepare_entries(input, options)

          if entries.any? {|e| !e.kind_of?(Hash)}
            fail "invalid input" if options[:fail]
            return []
          end

          entries.collect do |item|
            handle_item(item.with_indifferent_access, options)
          end
        end

        alias :parse! :from_source!
        alias :parse  :from_source

        private

        def prepare_entries(input, options)
          path = Source::Path.resolve(options, Transcriber.configuration.convert_input_keys)
          Array.wrap digg(input, path)
        end

        def handle_item(item, options)
          self.new.tap do |resource|
            keys.each do |key|
              begin
                resource.__send__("#{key.name}=", key.from_source(item, resource)) if key.present?(resource)
              rescue => exception
                raise exception if options[:fail]
              end
            end
          end
        end

        def digg(input, path)
          path.inject(input) {|buffer, key| buffer = buffer[key]}
        end
      end
    end
  end
end
