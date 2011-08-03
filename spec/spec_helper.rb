$:.push '../lib'

require 'transcriber'
require 'ostruct'
require 'json'

RSpec.configure do |config|
  config.before(:each) do
    [:Example, :ExampleChild].each do |klass|
      Object.send(:remove_const, klass) if Object.const_defined? klass
    end
  end
end

include Transcriber
