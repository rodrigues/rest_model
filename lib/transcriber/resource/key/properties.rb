class Transcriber::Resource
  module Properties
    def id(*values)
      options = {}
      options = values.pop if values.last.kind_of? Hash
      name = values.fetch(0, :id)
      property(name, options.merge(id: true))
    end

    def property(name, options = {})
      attr_accessor name
      Property.new(name, options).tap do |property|
        keys << property
        id = property if options[:id]
      end
    end

    def properties(*names)
      options = {}
      options = names.pop if names.last.kind_of? Hash
      names.each {|name| property(name, options)}
    end

  end
end