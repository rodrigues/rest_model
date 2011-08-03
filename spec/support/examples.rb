module Examples
  def context_from_example(file, &block)
    context "example #{file}" do
      silently {eval File.read("examples/#{file}.rb")}
      variables = instance_variables.reject {|var| var.to_s =~ /metadata$/}

      variables.each do |var|
        let(var.to_s.gsub(/@/, "")) { instance_variable_get(var) }
      end

      values = variables.inject({}) do |buffer, name|
        buffer[name.to_s.gsub(/@/, "")] = instance_variable_get(name)
        buffer
      end

      before :all do
        values.each do |name, value|
          instance_variable_set "@#{name}", value
        end
      end

      instance_eval &block if block
    end
  end
end
