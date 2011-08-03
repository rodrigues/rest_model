$:.push '../lib'

require 'transcriber'
require 'ostruct'

RSpec.configure do |config|
  config.before(:each) do
    [:Example, :ExampleChild].each do |klass|
      Object.send(:remove_const, klass) if Object.const_defined? klass
    end
  end
end

include Transcriber
