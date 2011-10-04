$:.push '../lib'

require 'rest_model'
require 'ostruct'
require 'json'
require 'stringio'
require 'active_support/core_ext/hash/indifferent_access'

require 'support/shared_examples'
require 'support/examples'
require 'support/out'

RSpec.configure do |config|
  config.before do
    [:Example, :ExampleChild].each do |klass|
      Object.send(:remove_const, klass) if Object.const_defined? klass
    end
  end
end

include Output
include Examples

RestModel::Configuration.configure do |c|
  c.host = 'http://example.com'
end
