$:.push '../lib'

require 'transcriber'
require 'ostruct'
require 'json'
require 'stringio'

module OutputHelper
  extend self
  def get_output
    result = StringIO.new
    begin
      $stdout = result
      yield
    ensure
      $stdout = STDOUT
    end
    result.string
  end
end

RSpec.configure do |config|
  config.before(:each) do
    [:Example, :ExampleChild].each do |klass|
      Object.send(:remove_const, klass) if Object.const_defined? klass
    end
  end
end

include Transcriber
