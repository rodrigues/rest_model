require 'spec_helper'
require 'resource/converter_spec'

describe Transcriber::Resource do
  before do
    class Example < Transcriber::Resource
      property :login
      property :name
      property :age, type: Float
    end
  end

  describe '#resource' do
    it "returns a hash with properties and its values" do
      example = Example.new(login: 'jackiechan2010', name: 'Jackie Chan', age: 45)
      example.resource.should ==    {login: 'jackiechan2010', name: 'Jackie Chan', age: 45}
    end
  end
end
