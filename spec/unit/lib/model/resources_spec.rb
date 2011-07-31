require 'spec_helper'

describe Transcriber::Resource::Resources do

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

  describe '.resources' do
    it "returns a hash with entries" do
      entries = [ExampleResources.new(login: 'jackiechan2010', name: 'Jackie Chan', age: 45),
                 ExampleResources.new(login: 'brucelee',       name: 'Bruce Lee',   age: 10)]

      resources = ExampleResources.resources(entries)
      resources.should == {entries: [{login: 'jackiechan2010', name: 'Jackie Chan', age: 45},
                                     {login: 'brucelee',       name: 'Bruce Lee',   age: 10}]}
    end
  end
end