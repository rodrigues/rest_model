require 'spec_helper'
require 'resource/converter_spec'

describe Transcriber::Resource do
  class ExampleResources < Transcriber::Resource
    property :login
    property :name
    property :age, type: Float
  end

  describe '#resource' do
    it "returns a hash with properties and its values" do
      example = ExampleResources.new(login: 'jackiechan2010', name: 'Jackie Chan', age: 45)
      example.resource.should ==    {login: 'jackiechan2010', name: 'Jackie Chan', age: 45}
    end
  end
end
