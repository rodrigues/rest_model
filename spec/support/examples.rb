module Examples
  def describe_example(file, &block)
    describe "example #{file}" do
      [:Root, :Item, :Customer, :Entry].each do |klass|
        Examples.send(:remove_const, klass) if Examples.const_defined?(klass)
      end

      # silently {

        eval File.read("examples/#{file}.rb")

        # }

      variables = instance_variables.reject {|var| var.to_s =~ /metadata$/}

      values = variables.inject({}) do |buffer, name|
        method_name = name.to_s.gsub(/@/, "")
        let(method_name)           {instance_variable_get(name)}
        buffer.merge method_name => instance_variable_get(name)
      end

      before :all do
        values.each {|name, value| instance_variable_set "@#{name}", value}
      end

      instance_eval &block if block
    end
  end
end
