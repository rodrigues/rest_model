class RestModel
  class Property
    module Builder
      def property(name, options = {})
        options[:validate] = !options[:validate_if_present]
        key Property.new(name, options)
      end

      def properties(*args)
        options = options(args)
        names = args
        names.each {|name| property(name, options)}
      end

      def id(*args)
        options = options(args)
        name = args.fetch(0, :id)
        property(name, options.merge(id: true))
      end

      private

      def options(args)
        args.last.kind_of?(Hash) ? args.pop : {}
      end
    end
  end
end
