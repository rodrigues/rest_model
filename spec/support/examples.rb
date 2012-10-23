EXAMPLES_CONSTANTS = %w(Root       Item     Customer  Entry
                        Service    Billing  Developer Upcasing
                        Camelizing Product  Address   Phone)

def describe_example(file, tags = {}, &block)
  describe "example #{file}", tags do
    before :all do
      EXAMPLES_CONSTANTS.each do |klass|
        Object.send(:remove_const, klass) if Object.const_defined?(klass, false)
      end

      RestModel::Configuration.configure do |c|
        c.convert_input_keys = RestModel::Configuration::DefaultHandler
      end

      silently {eval File.read("examples/#{file}.rb")}
    end

    instance_eval &block if block
  end
end
