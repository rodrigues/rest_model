module Transcriber
  class Resource
    module Builder
      module Properties
        def id(*args)
          options = options(args)
          name = args.fetch(0, :id)
          property(name, options.merge(id: true))
        end

        def property(name, options = {})
          attr_accessor name
          Property.new(name, options).tap do |property|
            self.keys  << property
            self.id_key = property if options[:id]
          end
        end

        def properties(*args)
          options = options(args)
          names = args
          names.each {|name| property(name, options)}
        end

        private

        def options(args)
          args.last.kind_of?(Hash) ? args.pop : {}
        end
      end
    end
  end
end
