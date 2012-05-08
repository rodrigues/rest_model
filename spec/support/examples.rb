module Examples
  extend RSpec::Core::Hooks

  CONSTANTS = %w(Root       Item     Customer  Entry
                 Service    Billing  Developer Upcasing
                 Camelizing Product  Address   Phone)

  def describe_example(file, tags = {}, &block)
    describe "example #{file}", tags do
      before :all do
        CONSTANTS.each do |klass|
          self.class.ancestors.concat([self.class, Examples]).each do |mod|
            mod.send(:remove_const, klass) if mod.const_defined?(klass, false)
          end
        end

        RestModel::Configuration.configure do |c|
          c.convert_input_keys = RestModel::Configuration::DefaultHandler
        end

        silently {eval File.read("examples/#{file}.rb")}
      end

      instance_eval &block if block
    end
  end
end
