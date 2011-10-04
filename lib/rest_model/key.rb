class RestModel
  class Key
    attr_accessor :name, :model, :options, :summarize

    def initialize(name, options = {})
      @name    = name
      @options = options
    end

    def convert_input_keys
      options.fetch(:convert_input_keys, model.try(:convert_input_keys) ||
                    RestModel::Configuration.convert_input_keys)
    end

    def source_path
      return @source_path.clone if @source_path

      @source_path = Source::Path.resolve(options, convert_input_keys)

      if @source_path.empty? and !root_path?
        @source_path = convert_input_keys.call([name])
      end

      @source_path.clone
    end

    def root_path?
      path_definition = options.slice(:start_key, :field)
      path_definition.any? and path_definition.first[1].empty?
    end

    def present?(resource)
      !options[:if] ? true : resource.instance_eval(&options[:if])
    end

    def visible?(resource)
      !present?(resource) ? false : case visible = options[:visible]
                                    when nil  then true
                                    when Proc then resource.instance_eval(&visible)
                                    else visible
                                    end
    end
  end
end
