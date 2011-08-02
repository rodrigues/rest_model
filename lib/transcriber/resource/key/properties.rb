class Transcriber::Resource
  module Properties
    def id(*values)
      options = options(values)
      name = values.fetch(0, :id)
      property(name, options.merge(id: true))
    end

    def property(name, options = {})
      attr_accessor name
      Property.new(name, options).tap do |property|
        self.keys  << property
        self.id_key = property if options[:id]
      end
    end

    def properties(*names)
      options = options(names)
      names.each {|name| property(name,options)}
    end

    private

    def options(values)
      values.last.kind_of?(Hash) ? values.pop : {}
    end
  end
end